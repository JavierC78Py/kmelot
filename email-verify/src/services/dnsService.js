const dns = require('dns').promises;
const { getCache, setCache } = require('../config/redis');
const logger = require('../config/logger');
const { VALIDATION_CONFIG } = require('../config/constants');

/**
 * Valida registros MX de un dominio con cache
 */
async function validateMXRecords(domain) {
    const cacheKey = `mx:${domain.toLowerCase()}`;
    
    // Intentar obtener del cache
    const cached = await getCache(cacheKey);
    if (cached !== null) {
        logger.debug(`MX Cache HIT: ${domain}`);
        return cached === 'true';
    }
    
    logger.debug(`MX Cache MISS: ${domain}`);
    
    // Validar MX
    try {
        const records = await Promise.race([
            dns.resolveMx(domain),
            new Promise((_, reject) => 
                setTimeout(() => reject(new Error('DNS timeout')), VALIDATION_CONFIG.DNS_TIMEOUT)
            )
        ]);
        
        const hasRecords = records && records.length > 0;
        
        // Guardar en cache
        const ttl = parseInt(process.env.MX_CACHE_TTL) || 86400;
        await setCache(cacheKey, hasRecords.toString(), ttl);
        
        logger.debug(`MX Records for ${domain}:`, hasRecords ? `${records.length} found` : 'none');
        
        return hasRecords;
        
    } catch (error) {
        logger.debug(`MX validation failed for ${domain}:`, error.code || error.message);
        
        // Cachear resultado negativo por menos tiempo
        await setCache(cacheKey, 'false', 3600); // 1 hora
        
        return false;
    }
}

/**
 * Valida si el dominio resuelve (A o AAAA records)
 */
async function validateDomainResolution(domain) {
    try {
        await Promise.race([
            dns.resolve4(domain),
            new Promise((_, reject) => 
                setTimeout(() => reject(new Error('DNS timeout')), VALIDATION_CONFIG.DNS_TIMEOUT)
            )
        ]);
        return true;
    } catch (error) {
        // Intentar IPv6
        try {
            await Promise.race([
                dns.resolve6(domain),
                new Promise((_, reject) => 
                    setTimeout(() => reject(new Error('DNS timeout')), VALIDATION_CONFIG.DNS_TIMEOUT)
                )
            ]);
            return true;
        } catch (error6) {
            logger.debug(`Domain resolution failed for ${domain}`);
            return false;
        }
    }
}

module.exports = {
    validateMXRecords,
    validateDomainResolution
};