 sudo systemctl start  mysqld
 pm2 stop 2

cd /home/opc/face-recog-server2/
pm2 start index.js --name Face-Recognition -i 3
cd baileys-sm
pm2 start "npm run start" --name "WhatsApp-ClinicaSM"

URL_WEBHOOK="http://144.22.59.124:4302 https://kmelot.online/ords/clinicasm/whatsapp/webhook"

SM .env
PORT="4302"
NODE_ENV="development"
URL_WEBHOOK="https://kmelot.online/ords/clinicasm/whatsapp/webhook"
ENABLE_WEBHOOK="true"
ENABLE_WEBSOCKET="true"
BOT_NAME="Kmelot Whatsapp Bot"
DATABASE_URL="mysql://baileys_user02:Secreto*2024@localhost:3306/baileys_db02"
LOG_LEVEL="info"
RECONNECT_INTERVAL="5000"
MAX_RECONNECT_RETRIES="5"
SSE_MAX_QR_GENERATION="10"
SESSION_CONFIG_ID="session-config"
API_KEY="0a580dfc-120b-458a-b6c8-5c288a48ea4f"
