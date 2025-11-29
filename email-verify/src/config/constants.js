/**
 * Constantes de configuración para validación de emails
 */

// Dominios paraguayos confiables
const PARAGUAYAN_TRUSTED_DOMAINS = new Set([
    // TLDs paraguayos
    'py',
    'com.py',
    'org.py',
    'net.py',
    'edu.py',
    'gov.py',
    'mil.py',
    
    // Gubernamentales
    'presidencia.gov.py',
    'mec.gov.py',
    'mspbs.gov.py',
    'hacienda.gov.py',
    'senado.gov.py',
    'congreso.gov.py',
    'tsje.gov.py',
    'contraloria.gov.py',
    'mtess.gov.py',
    'mic.gov.py',
    'mopc.gov.py',
    'mades.gov.py',
    'mag.gov.py',
    'mitic.gov.py',
    
    // Institucionales
    'itaipu.gov.py',
    'ande.gov.py',
    'essap.com.py',
    'copaco.com.py',
    'correoparaguayo.gov.py',
    
    // Educativos
    'una.py',
    'uni.edu.py',
    'uca.edu.py',
    'upap.edu.py',
    
    // Empresariales conocidos
    'santaclara.com.py',
    'stock.com.py',
    'personal.com.py',
    'tigo.com.py',
    'claro.com.py'
]);

// ===== NUEVO: Dominios internacionales confiables =====
const INTERNATIONAL_TRUSTED_DOMAINS = new Set([
    // Microsoft
    'hotmail.com',
    'hotmail.co.uk',
    'hotmail.fr',
    'hotmail.es',
    'hotmail.de',
    'hotmail.it',
    'outlook.com',
    'outlook.es',
    'outlook.com.ar',
    'outlook.com.br',
    'live.com',
    'msn.com',
    
    // Google
    'gmail.com',
    'googlemail.com',
    
    // Apple
    'icloud.com',
    'me.com',
    'mac.com',
    
    // Yahoo
    'yahoo.com',
    'yahoo.es',
    'yahoo.com.ar',
    'yahoo.com.br',
    'ymail.com',
    
    // AOL
    'aol.com',
    
    // Protonmail
    'protonmail.com',
    'proton.me',
    'pm.me',
    
    // Otros populares
    /*'zoho.com',
    'gmx.com',
    'gmx.de',
    'mail.com',
    'fastmail.com',
    'tutanota.com',
    'tutanota.de',
    'mailfence.com',
    'posteo.de',
    'runbox.com'*/
]);

// Regex para validación de emails paraguayos
const PARAGUAYAN_EMAIL_REGEX = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(gov\.py|com\.py|org\.py|net\.py|edu\.py|mil\.py|py)$/i;

// Regex básico RFC 5322 simplificado
const BASIC_EMAIL_REGEX = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

// Dominios desechables conocidos (expandir según necesidad)
const DISPOSABLE_DOMAINS = new Set([
    'tempmail.com',
    '10minutemail.com',
    'guerrillamail.com',
    'mailinator.com',
    'throwaway.email',
    'maildrop.cc',
    'temp-mail.org',
    'getnada.com',
    'trashmail.com',
    'sharklasers.com',
    'guerrillamail.info',
    'grr.la',
    'guerrillamail.biz',
    'guerrillamail.de',
    'spam4.me',
    'mail-temporaire.fr',
    'yopmail.com',
    'yopmail.fr',
    'cool.fr.nf',
    'jetable.fr.nf',
    'nospam.ze.tc',
    'nomail.xl.cx',
    'mega.zik.dj',
    'speed.1s.fr',
    'courriel.fr.nf',
    'moncourrier.fr.nf',
    'monemail.fr.nf',
    'monmail.fr.nf'
]);

// Timeouts y límites
const VALIDATION_CONFIG = {
    DNS_TIMEOUT: 5000,
    DEEP_VALIDATION_TIMEOUT: parseInt(process.env.VALIDATION_TIMEOUT) || 10000, // Aumentado a 10s
    MAX_EMAIL_LENGTH: 320,
    MAX_LOCAL_PART_LENGTH: 64,
    MAX_DOMAIN_LENGTH: 255
};

module.exports = {
    PARAGUAYAN_TRUSTED_DOMAINS,
    INTERNATIONAL_TRUSTED_DOMAINS, // NUEVO
    PARAGUAYAN_EMAIL_REGEX,
    BASIC_EMAIL_REGEX,
    DISPOSABLE_DOMAINS,
    VALIDATION_CONFIG
};