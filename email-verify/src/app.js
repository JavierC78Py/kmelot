require('dotenv').config();
const express = require('express');
const helmet = require('helmet');
const cors = require('cors');
const { initRedis, closeRedis } = require('./config/redis');
const rateLimiter = require('./middleware/rateLimiter');
const { errorHandler, notFoundHandler } = require('./middleware/errorHandler');
const validationRoutes = require('./routes/validation');
const logger = require('./config/logger');
const fs = require('fs');
const path = require('path');

// Crear directorio de logs si no existe
const logsDir = path.join(__dirname, '..', 'logs');
if (!fs.existsSync(logsDir)) {
    fs.mkdirSync(logsDir, { recursive: true });
}

const app = express();
const PORT = process.env.PORT || 3150;
const HOST = process.env.HOST || '0.0.0.0';

// ============ MIDDLEWARES ============

// Security headers
app.use(helmet({
    contentSecurityPolicy: false
}));

// CORS
const corsOptions = {
    origin: process.env.CORS_ORIGIN || '*',
    methods: ['GET', 'POST'],
    allowedHeaders: ['Content-Type', 'x-api-key'],
    credentials: true
};
app.use(cors(corsOptions));

// Body parser
app.use(express.json({ limit: '10mb' }));
app.use(express.urlencoded({ extended: true, limit: '10mb' }));

// Request logging
app.use((req, res, next) => {
    const start = Date.now();
    
    res.on('finish', () => {
        const duration = Date.now() - start;
        logger.info('HTTP Request', {
            method: req.method,
            path: req.path,
            status: res.statusCode,
            duration: `${duration}ms`,
            ip: req.ip
        });
    });
    
    next();
});

// Rate limiting
app.use('/api', rateLimiter);

// ============ ROUTES ============

app.use('/api', validationRoutes);

// Root endpoint
app.get('/', (req, res) => {
    res.json({
        service: 'Email Validator API',
        version: '1.0.0',
        status: 'running',
        endpoints: {
            validateEmail: 'POST /api/validate-email',
            validateBatch: 'POST /api/validate-batch',
            health: 'GET /api/health',
            stats: 'GET /api/stats',
            admin: 'POST /api/admin/* (requires API key)'
        }
    });
});

// ============ ERROR HANDLERS ============

app.use(notFoundHandler);
app.use(errorHandler);

// ============ SERVER STARTUP ============

async function startServer() {
    try {
        // Inicializar Redis y esperar a que la conexión esté lista
        logger.info('Inicializando Redis...');
        await initRedis();
        
        // Iniciar servidor
        const server = app.listen(PORT, HOST, () => {
            logger.info(`
╔════════════════════════════════════════════════╗
║   Email Validator Service                      ║
║   Running on http://${HOST}:${PORT}          ║
║   Environment: ${process.env.NODE_ENV}                    ║
║   Redis: ${require('./config/redis').isAvailable() ? 'Connected' : 'Disconnected'}                            ║
╚════════════════════════════════════════════════╝
            `);
        });
        
        // Graceful shutdown
        process.on('SIGTERM', () => gracefulShutdown(server));
        process.on('SIGINT', () => gracefulShutdown(server));
        
    } catch (error) {
        logger.error('Error starting server:', error);
        process.exit(1);
    }
}

/**
 * Graceful shutdown
 */
async function gracefulShutdown(server) {
    logger.info('Iniciando graceful shutdown...');
    
    // Detener de aceptar nuevas conexiones
    server.close(async () => {
        logger.info('Server closed');
        
        // Cerrar Redis
        await closeRedis();
        
        logger.info('Shutdown completo');
        process.exit(0);
    });
    
    // Forzar cierre después de 10 segundos
    setTimeout(() => {
        logger.error('Forcing shutdown after timeout');
        process.exit(1);
    }, 10000);
}

// Start server
startServer();

module.exports = app;