#!/bin/bash
# filepath: /home/oem/Desktop/n8n-docker/setup.sh

echo "Iniciando configuração do ambiente..."

# Instalar Docker e Docker Compose
echo "Instalando Docker e Docker Compose..."
sudo apt update
sudo apt install -y docker.io docker-compose
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER

# Criar o arquivo .env se não existir
if [ ! -f .env ]; then
  echo "Criando arquivo .env..."
  cp .env.example .env
fi

# Gerar certificados SSL
if [ ! -d certs ]; then
  echo "Gerando certificados SSL..."
  mkdir certs
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout certs/key.pem \
    -out certs/cert.pem \
    -subj "/CN=localhost"
fi

# Iniciar os containers
echo "Iniciando os containers do Docker..."
docker-compose up -d

echo "Configuração concluída! Acesse o n8n em:"
echo " - Local: https://localhost"
echo " - Externo (via ngrok): execute 'ngrok http https://localhost:443'"