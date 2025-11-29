const Redis = require('ioredis');
const logger = require('./logger');

let redisClient = null;
let isRedisAvailable = false;

/**
 * Inicializa conexión Redis con manejo de errores
 */
function initRedis() {
    try {
        redisClient = new Redis({
            host: process.env.REDIS_HOST || 'localhost',
            port: parseInt(process.env.REDIS_PORT) || 6379,
            password: process.env.REDIS_PASSWORD || undefined,
            db: parseInt(process.env.REDIS_DB) || 0,
            retryStrategy: (times) => {
                const delay = Math.min(times * 50, 2000);
                return delay;
            },
            maxRetriesPerRequest: 3,
            enableReadyCheck: true,
            lazyConnect: true
        });

        redisClient.on('connect', () => {
            logger.info('Redis: Conectando...');
        });

        redisClient.on('ready', () => {
            isRedisAvailable = true;
            logger.info('Redis: Conexión establecida correctamente');
        });

        redisClient.on('error', (err) => {
            isRedisAvailable = false;
            logger.error('Redis Error:', err.message);
        });

        redisClient.on('close', () => {
            isRedisAvailable = false;
            logger.warn('Redis: Conexión cerrada');
        });

        redisClient.on('reconnecting', () => {
            logger.info('Redis: Reconectando...');
        });

        // Intentar conectar
        redisClient.connect().catch(err => {
            logger.error('Redis: No se pudo conectar:', err.message);
            isRedisAvailable = false;
        });

    } catch (error) {
        logger.error('Redis: Error en inicialización:', error.message);
        isRedisAvailable = false;
    }

    return redisClient;
}

/**
 * Obtener valor del cache con fallback
 */
async function getCache(key) {
    if (!isRedisAvailable || !redisClient) {
        return null;
    }

    try {
        return await redisClient.get(key);
    } catch (error) {
        logger.error(`Redis GET error for key ${key}:`, error.message);
        return null;
    }
}

/**
 * Guardar valor en cache con TTL
 */
async function setCache(key, value, ttl) {
    if (!isRedisAvailable || !redisClient) {
        return false;
    }

    try {
        if (ttl) {
            await redisClient.setex(key, ttl, value);
        } else {
            await redisClient.set(key, value);
        }
        return true;
    } catch (error) {
        logger.error(`Redis SET error for key ${key}:`, error.message);
        return false;
    }
}

/**
 * Eliminar key del cache
 */
async function delCache(key) {
    if (!isRedisAvailable || !redisClient) {
        return false;
    }

    try {
        await redisClient.del(key);
        return true;
    } catch (error) {
        logger.error(`Redis DEL error for key ${key}:`, error.message);
        return false;
    }
}

/**
 * Verificar si Redis está disponible
 */
function isAvailable() {
    return isRedisAvailable;
}

/**
 * Cerrar conexión Redis
 */
async function closeRedis() {
    if (redisClient) {
        try {
            await redisClient.quit();
            logger.info('Redis: Conexión cerrada correctamente');
        } catch (error) {
            logger.error('Redis: Error al cerrar conexión:', error.message);
        }
    }
}

/**
 * Logger básico (reemplazar con winston)
 */
/*const basicLogger = {
    info: (msg, ...args) => console.log(`[INFO] ${msg}`, ...args),
    error: (msg, ...args) => console.error(`[ERROR] ${msg}`, ...args),
    warn: (msg, ...args) => console.warn(`[WARN] ${msg}`, ...args)
};

const logger = basicLogger;*/

module.exports = {
    initRedis,
    getCache,
    setCache,
    delCache,
    isAvailable,
    closeRedis,
    getClient: () => redisClient
};