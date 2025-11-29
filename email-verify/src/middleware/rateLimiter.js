const rateLimit = require('express-rate-limit');
const { getClient } = require('../config/redis');
const logger = require('../config/logger');

/**
 * Rate limiter con Redis store
 */
const createRateLimiter = () => {
    const windowMs = parseInt(process.env.RATE_LIMIT_WINDOW_MS) || 900000; // 15 min
    const max = parseInt(process.env.RATE_LIMIT_MAX_REQUESTS) || 100;
    
    const limiter = rateLimit({
        windowMs: windowMs,
        max: max,
        message: {
            error: 'Demasiadas solicitudes desde esta IP',
            retryAfter: Math.ceil(windowMs / 1000)
        },
        standardHeaders: true,
        legacyHeaders: false,
        // Redis store si está disponible
        store: createRedisStore(),
        skip: (req) => {
            // Skip para health check
            return req.path === '/api/health';
        },
        handler: (req, res) => {
            logger.warn(`Rate limit exceeded for IP: ${req.ip}`);
            res.status(429).json({
                error: 'Demasiadas solicitudes',
                message: 'Has excedido el límite de solicitudes. Intenta nuevamente más tarde.',
                retryAfter: Math.ceil(windowMs / 1000)
            });
        }
    });
    
    return limiter;
};

/**
 * Redis store para rate limiter
 */
function createRedisStore() {
    const redisClient = getClient();
    
    if (!redisClient) {
        logger.warn('Redis no disponible, usando rate limiter en memoria');
        return undefined; // Usará store en memoria por defecto
    }
    
    try {
        const RedisStore = require('rate-limit-redis');
        return new RedisStore({
            client: redisClient,
            prefix: 'rl:'
        });
    } catch (error) {
        logger.error('Error configurando Redis store para rate limiter:', error.message);
        return undefined;
    }
}

module.exports = createRateLimiter();