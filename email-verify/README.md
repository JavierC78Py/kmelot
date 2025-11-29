# Email Validator Service

Servicio de validación de emails con soporte especial para dominios paraguayos empresariales y gubernamentales.

## Características

- ✅ Validación completa de emails (formato, MX, DNS)
- 🇵🇾 Soporte para dominios paraguayos (.py, .com.py, .gov.py, etc.)
- ⚡ Cache Redis para alta performance
- 🛡️ Rate limiting y seguridad
- 📊 Endpoints de estadísticas y monitoreo
- 🐳 Dockerizado y listo para producción
- 📝 Logging estructurado con Winston

## Requisitos

- Node.js 18+
- Redis 7+ (opcional pero recomendado)
- Docker y Docker Compose (para deployment)

## Instalación Local

### 1. Clonar repositorio
```bash
git clone <repo>
cd email-validator-service
```

### 2. Instalar dependencias
```bash
npm install
```

### 3. Configurar variables de entorno
```bash
cp .env.example .env
# Editar .env con tus configuraciones
```

### 4. Iniciar Redis (opcional)
```bash
# Con Docker
docker run -d -p 6379:6379 --name redis redis:7-alpine

# O instalar localmente
# macOS: brew install redis && redis-server
# Ubuntu: sudo apt install redis-server && sudo systemctl start redis
```

### 5. Iniciar servicio
```bash
# Desarrollo
npm run dev

# Producción
npm start
```

## Deployment con Docker

### Usando Docker Compose (Recomendado)
```bash
# Iniciar servicios
npm run docker:up

# Ver logs
npm run docker:logs

# Detener servicios
npm run docker:down
```

### Build manual
```bash
# Build imagen
docker build -t email-validator:latest .

# Run container
docker run -d \
  -p 3150:3150 \
  -e REDIS_HOST=host.docker.internal \
  --name email-validator \
  email-validator:latest
```

## Uso de la API

### Validar un email
```bash
curl -X POST http://localhost:3150/api/validate-email \
  -H "Content-Type: application/json" \
  -d '{"email": "sotelos@santaclara.com.py"}'
```

Respuesta:
```json
{
  "valid": true,
  "reason": "Email paraguayo con registros MX válidos",
  "email": "sotelos@santaclara.com.py",
  "validators": {
    "format": true,
    "paraguayan": true,
    "disposable": true,
    "mx": true,
    "dns": true,
    "deepValidation": false
  },
  "fromCache": false
}
```

### Validar múltiples emails
```bash
curl -X POST http://localhost:3150/api/validate-batch \
  -H "Content-Type: application/json" \
  -d '{
    "emails": [
      "user1@santaclara.com.py",
      "user2@gov.py",
      "invalid@example.com"
    ]
  }'
```

### Health Check
```bash
curl http://localhost:3150/api/health
```

### Estadísticas
```bash
curl http://localhost:3150/api/stats
```

## Endpoints Admin

### Agregar dominio a whitelist
```bash
curl -X POST http://localhost:3150/api/admin/whitelist/add \
  -H "Content-Type: application/json" \
  -H "x-api-key: your-admin-key" \
  -d '{"domain": "miempresa.com.py"}'
```

### Ver whitelist completa
```bash
curl http://localhost:3150/api/admin/whitelist \
  -H "x-api-key: your-admin-key"
```

## Testing
```bash
# Ejecutar suite de tests
npm test

# Resultados esperados:
# ✓ Emails paraguayos válidos aceptados
# ✓ Emails con formato inválido rechazados
# ✓ Dominios desechables rechazados
# ✓ Cache funcionando correctamente
```

## Configuración

### Variables de Entorno

| Variable | Descripción | Default |
|----------|-------------|---------|
| `NODE_ENV` | Entorno (development/production) | development |
| `PORT` | Puerto del servidor | 3150 |
| `REDIS_HOST` | Host de Redis | localhost |
| `REDIS_PORT` | Puerto de Redis | 6379 |
| `MX_CACHE_TTL` | TTL cache MX (segundos) | 86400 |
| `EMAIL_CACHE_TTL` | TTL cache email (segundos) | 3600 |
| `RATE_LIMIT_MAX_REQUESTS` | Requests por ventana | 100 |
| `ADMIN_API_KEY` | API key para endpoints admin | - |
| `LOG_LEVEL` | Nivel de logging (debug/info/warn/error) | info |

### Dominios Confiables

Los dominios paraguayos están pre-configurados en `src/config/constants.js`:

- TLDs: `.py`, `.com.py`, `.gov.py`, `.org.py`, `.edu.py`
- Gubernamentales: `mec.gov.py`, `hacienda.gov.py`, etc.
- Empresariales: `santaclara.com.py`, `personal.com.py`, etc.

## Performance

- **Cache Hit Rate**: >80% en producción
- **Response Time**: <50ms (con cache), <500ms (sin cache)
- **Throughput**: 100+ requests/segundo por instancia
- **Memory**: ~150MB por instancia

## Seguridad

- ✅ Helmet.js para security headers
- ✅ Rate limiting por IP
- ✅ CORS configurable
- ✅ Input validation estricta
- ✅ API key para endpoints admin
- ✅ No exposición de stack traces en producción

## Monitoreo

### Logs

Los logs se guardan en `logs/`:
- `combined.log`: Todos los logs
- `error.log`: Solo errores

### Health Check Endpoint
```
GET /api/health
```

Retorna:
- Status del servicio
- Conexión Redis
- Uptime
- Timestamp

## Troubleshooting

### Redis no conecta
```bash
# Verificar si Redis está corriendo
redis-cli ping

# Reiniciar Redis
docker restart email-validator-redis
```

### Port already in use
```bash
# Cambiar puerto en .env
PORT=3151

# O detener proceso existente
lsof -ti:3150 | xargs kill -9
```

### Cache no funciona

El servicio funciona sin Redis, pero con performance reducida. Verifica logs:
```bash
docker logs email-validator-api | grep Redis
```

## Licencia

MIT

## Soporte

Para issues o consultas, crear un issue en el repositorio.