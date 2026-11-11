#!/bin/bash

set -e

cd /home/ubuntu/app

# Instalar Node.js y npm si no existen
if ! command -v node >/dev/null 2>&1; then
    apt-get update
    apt-get install -y nodejs npm
fi

# Instalar dependencias
npm install --omit=dev

# Crear servicio para ejecutar la aplicación
cat > /etc/systemd/system/datavision.service <<'EOF'
[Unit]
Description=DataVision Node.js App
After=network.target

[Service]
Type=simple
User=ubuntu
WorkingDirectory=/home/ubuntu/app
ExecStart=/usr/bin/node /home/ubuntu/app/server.js
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Iniciar aplicación
systemctl daemon-reload
systemctl enable datavision
systemctl restart datavision

echo "DataVision instalada correctamente"
