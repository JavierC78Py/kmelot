const { validate } = require('deep-email-validator');
const { getCache, setCache } = require('../config/redis');
const { validateMXRecords, validateDomainResolution } = require('./dnsService');
const logger = require('../config/logger');
const {
    PARAGUAYAN_TRUSTED_DOMAINS,
    INTERNATIONAL_TRUSTED_DOMAINS, // NUEVO
    PARAGUAYAN_EMAIL_REGEX,
    BASIC_EMAIL_REGEX,
    DISPOSABLE_DOMAINS,
    VALIDATION_CONFIG
} = require('../config/constants');

/**
 * Verifica si un dominio está en la lista de confianza paraguaya
 */
function isParaguayanTrustedDomain(email) {
    const domain = email.split('@')[1]?.toLowerCase();
    if (!domain) return false;
    
    // Verifica si termina en .py
    if (!domain.endsWith('.py')) return false;
    
    // Verifica si está en whitelist exacta
    if (PARAGUAYAN_TRUSTED_DOMAINS.has(domain)) return true;
    
    // Verifica patrones de dominio (com.py, gov.py, etc.)
    const domainParts = domain.split('.');
    if (domainParts.length >= 2) {
        const tld = domainParts.slice(-2).join('.');
        if (PARAGUAYAN_TRUSTED_DOMAINS.has(tld)) return true;
    }
    
    return false;
}

/**
 * NUEVO: Verifica si es un dominio internacional confiable
 */
function isInternationalTrustedDomain(email) {
    const domain = email.split('@')[1]?.toLowerCase();
    return domain && INTERNATIONAL_TRUSTED_DOMAINS.has(domain);
}

/**
 * Verifica si es un dominio desechable
 */
function isDisposableDomain(email) {
    const domain = email.split('@')[1]?.toLowerCase();
    return domain && DISPOSABLE_DOMAINS.has(domain);
}

/**
 * Validación de formato y longitud
 */
function validateFormat(email) {
    if (!email || typeof email !== 'string') {
        return { valid: false, reason: 'Email no proporcionado o inválido' };
    }
    
    // Validar longitud total
    if (email.length > VALIDATION_CONFIG.MAX_EMAIL_LENGTH) {
        return { valid: false, reason: 'Email excede longitud máxima (320 caracteres)' };
    }
    
    // Validar formato básico
    if (!BASIC_EMAIL_REGEX.test(email)) {
        return { valid: false, reason: 'Formato de email inválido' };
    }
    
    // Validar partes del email
    const [localPart, domain] = email.split('@');
    
    if (localPart.length > VALIDATION_CONFIG.MAX_LOCAL_PART_LENGTH) {
        return { valid: false, reason: 'Parte local excede longitud máxima (64 caracteres)' };
    }
    
    if (domain.length > VALIDATION_CONFIG.MAX_DOMAIN_LENGTH) {
        return { valid: false, reason: 'Dominio excede longitud máxima (255 caracteres)' };
    }
    
    // Validar caracteres especiales
    if (localPart.startsWith('.') || localPart.endsWith('.') || localPart.includes('..')) {
        return { valid: false, reason: 'Formato de parte local inválido' };
    }
    
    return { valid: true };
}

/**
 * Validación profunda para emails internacionales
 * MEJORADO: Manejo de errores más robusto
 */
async function deepValidation(email, domain) {
    try {
        logger.debug(`Iniciando deep validation para: ${email}`);
        
        const result = await Promise.race([
            validate({
                email: email,
                validateRegex: true,
                validateMx: true,
                validateSmtp: false, // IMPORTANTE: Deshabilitado permanentemente
                validateDisposable: true
            }),
            new Promise((_, reject) => 
                setTimeout(() => reject(new Error('Validation timeout')), 
                VALIDATION_CONFIG.DEEP_VALIDATION_TIMEOUT)
            )
        ]);
        
        logger.debug(`Deep validation result for ${email}:`, result);
        
        return {
            valid: result.valid,
            reason: result.reason || 'Validación completada',
            validators: result.validators || {}
        };
        
    } catch (error) {
        logger.warn(`Deep validation error for ${email}: ${error.message}`);
        
        // No fallar si es un dominio internacional conocido
        if (INTERNATIONAL_TRUSTED_DOMAINS.has(domain)) {
            logger.info(`Dominio confiable, ignorando error de deep validation: ${domain}`);
            return {
                valid: true,
                reason: 'Dominio internacional conocido (validación ligera)',
                validators: {
                    regex: true,
                    mx: false,
                    smtp: false,
                    disposable: true
                },
                fallback: true
            };
        }
        
        return {
            valid: false,
            reason: 'Error en validación profunda: ' + error.message,
            error: error.message
        };
    }
}

/**
 * Validación principal de email con cache completo
 * MEJORADO: Mejor manejo de dominios internacionales
 */
async function validateEmail(email) {
    const normalizedEmail = email.trim().toLowerCase();
    const cacheKey = `email:${normalizedEmail}`;
    
    // Intentar obtener del cache
    const cached = await getCache(cacheKey);
    if (cached) {
        try {
            const result = JSON.parse(cached);
            result.fromCache = true;
            logger.debug(`Email validation cache HIT: ${normalizedEmail}`);
            return result;
        } catch (error) {
            logger.error('Error parsing cached result:', error.message);
        }
    }
    
    logger.debug(`Email validation cache MISS: ${normalizedEmail}`);
    
    // Inicializar resultado
    const result = {
        valid: false,
        reason: '',
        email: normalizedEmail,
        validators: {
            format: false,
            paraguayan: false,
            international_trusted: false, // NUEVO
            disposable: true,
            mx: false,
            dns: false,
            deepValidation: false
        },
        fromCache: false
    };
    
    // 1. Validación de formato
    const formatValidation = validateFormat(normalizedEmail);
    if (!formatValidation.valid) {
        result.reason = formatValidation.reason;
        await cacheResult(cacheKey, result, 3600);
        return result;
    }
    result.validators.format = true;
    
    // 2. Verificar dominio desechable
    if (isDisposableDomain(normalizedEmail)) {
        result.validators.disposable = false;
        result.reason = 'Dominio desechable no permitido';
        await cacheResult(cacheKey, result, 86400);
        return result;
    }
    
    const domain = normalizedEmail.split('@')[1];
    
    // 3. Verificar si es dominio paraguayo confiable
    const isParaguayan = isParaguayanTrustedDomain(normalizedEmail);
    result.validators.paraguayan = isParaguayan;
    
    // 4. NUEVO: Verificar si es dominio internacional confiable
    const isInternationalTrusted = isInternationalTrustedDomain(normalizedEmail);
    result.validators.international_trusted = isInternationalTrusted;
    
    // 5. Validación MX
    const hasMX = await validateMXRecords(domain);
    result.validators.mx = hasMX;
    
    // 6. Validación DNS (A/AAAA)
    const hasDNS = await validateDomainResolution(domain);
    result.validators.dns = hasDNS;
    
    // 7. Lógica de decisión para dominios paraguayos
    if (isParaguayan) {
        if (PARAGUAYAN_TRUSTED_DOMAINS.has(domain)) {
            if (hasMX || hasDNS) {
                result.valid = true;
                result.reason = 'Email de dominio paraguayo confiable';
                await cacheResult(cacheKey, result);
                return result;
            }
        }
        
        if (PARAGUAYAN_EMAIL_REGEX.test(normalizedEmail) && hasMX) {
            result.valid = true;
            result.reason = 'Email paraguayo con registros MX válidos';
            await cacheResult(cacheKey, result);
            return result;
        }
        
        result.reason = 'Dominio paraguayo sin registros MX o DNS válidos';
        await cacheResult(cacheKey, result, 3600);
        return result;
    }
    
    // 8. MEJORADO: Lógica para dominios internacionales
    if (isInternationalTrusted) {
        logger.info(`Dominio internacional confiable detectado: ${domain}`);
        
        // Para dominios confiables, usar validación ligera
        if (hasMX || hasDNS) {
            result.valid = true;
            result.reason = 'Email de dominio internacional confiable';
            result.validators.deepValidation = true; // Marcar como validado
            await cacheResult(cacheKey, result);
            return result;
        }
        
        // Si no tiene MX/DNS pero está en la lista confiable, intentar deep validation
        logger.warn(`Dominio confiable ${domain} sin MX/DNS, intentando deep validation`);
    }
    
    // 9. Para otros dominios internacionales: validación profunda
    const deepResult = await deepValidation(normalizedEmail, domain);
    result.validators.deepValidation = deepResult.valid;
    
    if (deepResult.valid) {
        result.valid = true;
        result.reason = deepResult.fallback 
            ? 'Email de dominio conocido (validación ligera)'
            : 'Email internacional válido';
        
        // Si fue por fallback, indicarlo
        if (deepResult.fallback) {
            result.validators.fallback = true;
        }
    } else {
        result.valid = false;
        result.reason = deepResult.reason || 'Validación estándar falló';
    }
    
    // Cache resultado
    await cacheResult(cacheKey, result);
    
    return result;
}

/**
 * Guarda resultado en cache
 */
async function cacheResult(key, result, customTTL = null) {
    try {
        const ttl = customTTL || parseInt(process.env.EMAIL_CACHE_TTL) || 3600;
        await setCache(key, JSON.stringify(result), ttl);
    } catch (error) {
        logger.error('Error caching result:', error.message);
    }
}

/**
 * Agrega dominio a whitelist (en memoria)
 */
function addTrustedDomain(domain) {
    const normalizedDomain = domain.toLowerCase();
    
    // Determinar si es paraguayo o internacional
    if (normalizedDomain.endsWith('.py')) {
        PARAGUAYAN_TRUSTED_DOMAINS.add(normalizedDomain);
    } else {
        INTERNATIONAL_TRUSTED_DOMAINS.add(normalizedDomain);
    }
    
    logger.info(`Dominio agregado a whitelist: ${normalizedDomain}`);
    return true;
}

/**
 * Elimina dominio de whitelist
 */
function removeTrustedDomain(domain) {
    const normalizedDomain = domain.toLowerCase();
    
    let removed = PARAGUAYAN_TRUSTED_DOMAINS.delete(normalizedDomain);
    if (!removed) {
        removed = INTERNATIONAL_TRUSTED_DOMAINS.delete(normalizedDomain);
    }
    
    if (removed) {
        logger.info(`Dominio eliminado de whitelist: ${normalizedDomain}`);
    }
    return removed;
}

/**
 * Obtiene lista de dominios confiables
 */
function getTrustedDomains() {
    return {
        paraguayan: Array.from(PARAGUAYAN_TRUSTED_DOMAINS),
        international: Array.from(INTERNATIONAL_TRUSTED_DOMAINS),
        total: PARAGUAYAN_TRUSTED_DOMAINS.size + INTERNATIONAL_TRUSTED_DOMAINS.size
    };
}

module.exports = {
    validateEmail,
    addTrustedDomain,
    removeTrustedDomain,
    getTrustedDomains,
    isParaguayanTrustedDomain,
    isInternationalTrustedDomain, // NUEVO
    isDisposableDomain
};