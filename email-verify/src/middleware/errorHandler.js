const logger = require('../config/logger');

/**
 * Middleware de manejo de errores global
 */
function errorHandler(err, req, res, next) {
    logger.error('Unhandled error:', {
        error: err.message,
        stack: err.stack,
        path: req.path,
        method: req.method,
        ip: req.ip
    });
    
    // No enviar stack trace en producción
    const errorResponse = {
        error: 'Error interno del servidor',
        message: process.env.NODE_ENV === 'development' ? err.message : 'Ocurrió un error procesando tu solicitud'
    };
    
    if (process.env.NODE_ENV === 'development') {
        errorResponse.stack = err.stack;
    }
    
    res.status(err.status || 500).json(errorResponse);
}

/**
 * Middleware para rutas no encontradas
 */
function notFoundHandler(req, res) {
    res.status(404).json({
        error: 'Ruta no encontrada',
        path: req.path
    });
}

module.exports = {
    errorHandler,
    notFoundHandler
};