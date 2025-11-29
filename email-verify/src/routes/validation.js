const express = require('express');
const router = express.Router();
const {
    validateEmail,
    addTrustedDomain,
    removeTrustedDomain,
    getTrustedDomains
} = require('../services/emailValidator');
const logger = require('../config/logger');
const { isAvailable } = require('../config/redis');

/**
 * POST /api/validate-email
 * Valida un email
 */
router.post('/validate-email', async (req, res, next) => {
    try {
        const { email } = req.body;
        
        if (!email) {
            return res.status(400).json({
                valid: false,
                reason: 'Email requerido',
                email: null
            });
        }
        
        if (typeof email !== 'string') {
            return res.status(400).json({
                valid: false,
                reason: 'Email debe ser una cadena de texto',
                email: null
            });
        }
        
        const result = await validateEmail(email);
        
        // Log para auditoría
        logger.info('Email validation:', {
            email: result.email,
            valid: result.valid,
            reason: result.reason,
            ip: req.ip,
            fromCache: result.fromCache
        });
        
        res.json(result);
        
    } catch (error) {
        next(error);
    }
});

/**
 * POST /api/validate-batch
 * Valida múltiples emails
 */
router.post('/validate-batch', async (req, res, next) => {
    try {
        const { emails } = req.body;
        
        if (!emails || !Array.isArray(emails)) {
            return res.status(400).json({
                error: 'Se requiere un array de emails'
            });
        }
        
        if (emails.length > 50) {
            return res.status(400).json({
                error: 'Máximo 50 emails por solicitud'
            });
        }
        
        const results = await Promise.all(
            emails.map(email => validateEmail(email))
        );
        
        res.json({
            total: results.length,
            valid: results.filter(r => r.valid).length,
            invalid: results.filter(r => !r.valid).length,
            results: results
        });
        
    } catch (error) {
        next(error);
    }
});

/**
 * GET /api/health
 * Health check
 */
router.get('/health', (req, res) => {
    res.json({
        status: 'ok',
        timestamp: new Date().toISOString(),
        redis: isAvailable() ? 'connected' : 'disconnected',
        uptime: process.uptime(),
        environment: process.env.NODE_ENV
    });
});

/**
 * GET /api/stats
 * Estadísticas del servicio
 */
router.get('/stats', (req, res) => {
    res.json({
        trustedDomains: getTrustedDomains().length,
        redis: isAvailable(),
        memory: process.memoryUsage(),
        uptime: process.uptime()
    });
});

// ============ RUTAS ADMIN (Proteger en producción) ============

/**
 * Middleware de autenticación admin
 */
function requireAdmin(req, res, next) {
    const apiKey = req.headers['x-api-key'] || req.body.apiKey;
    
    if (!apiKey || apiKey !== process.env.ADMIN_API_KEY) {
        return res.status(401).json({
            error: 'No autorizado',
            message: 'API key inválida o faltante'
        });
    }
    
    next();
}

/**
 * POST /api/admin/whitelist/add
 * Agregar dominio a whitelist
 */
router.post('/admin/whitelist/add', requireAdmin, (req, res) => {
    try {
        const { domain } = req.body;
        
        if (!domain) {
            return res.status(400).json({
                error: 'Dominio requerido'
            });
        }
        
        addTrustedDomain(domain);
        
        logger.info(`Admin: Dominio agregado a whitelist: ${domain}`, {
            ip: req.ip
        });
        
        res.json({
            success: true,
            domain: domain.toLowerCase(),
            message: 'Dominio agregado a whitelist'
        });
        
    } catch (error) {
        res.status(500).json({
            error: 'Error agregando dominio',
            message: error.message
        });
    }
});

/**
 * POST /api/admin/whitelist/remove
 * Eliminar dominio de whitelist
 */
router.post('/admin/whitelist/remove', requireAdmin, (req, res) => {
    try {
        const { domain } = req.body;
        
        if (!domain) {
            return res.status(400).json({
                error: 'Dominio requerido'
            });
        }
        
        const removed = removeTrustedDomain(domain);
        
        if (removed) {
            logger.info(`Admin: Dominio eliminado de whitelist: ${domain}`, {
                ip: req.ip
            });
            
            res.json({
                success: true,
                domain: domain.toLowerCase(),
                message: 'Dominio eliminado de whitelist'
            });
        } else {
            res.status(404).json({
                success: false,
                message: 'Dominio no encontrado en whitelist'
            });
        }
        
    } catch (error) {
        res.status(500).json({
            error: 'Error eliminando dominio',
            message: error.message
        });
    }
});

/**
 * GET /api/admin/whitelist
 * Obtener lista de dominios confiables
 */
router.get('/admin/whitelist', requireAdmin, (req, res) => {
    res.json({
        domains: getTrustedDomains(),
        total: getTrustedDomains().length
    });
});

module.exports = router;