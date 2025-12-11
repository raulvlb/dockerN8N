# dockerN8N

Este repositório contém a configuração necessária para executar o [n8n](https://n8n.io/) usando Docker, Docker Compose e ngrok. Siga as instruções abaixo para configurar o ambiente e iniciar o serviço.

---

## **Pré-requisitos**

Certifique-se de que você está usando uma distribuição Linux e que tem permissões de administrador (sudo).

---

## **Instalação do Docker e Docker Compose**

Se você ainda não tem o Docker e o Docker Compose instalados, siga os passos abaixo:

1. **Instale o Docker**:
   ```bash
   sudo apt update
   sudo apt install -y docker.io
   sudo systemctl start docker
   sudo systemctl enable docker
   ```

2. **Adicione seu usuário ao grupo `docker`** (para evitar usar `sudo` com Docker):
   ```bash
   sudo usermod -aG docker $USER
   newgrp docker
   ```

3. **Instale o Docker Compose**:
   ```bash
   sudo apt install -y docker-compose
   ```

4. **Verifique se o Docker e o Docker Compose estão instalados corretamente**:
   ```bash
   docker --version
   docker-compose --version
   ```

---

## **Instalação do ngrok**

O ngrok é usado para expor o serviço localmente para um domínio público. Siga os passos abaixo para instalá-lo:

1. **Baixe e instale o ngrok**:
   ```bash
   wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
   tar xvzf ngrok-v3-stable-linux-amd64.tgz
   sudo mv ngrok /usr/local/bin
   ```

2. **Autentique o ngrok** (registre-se em [ngrok.com](https://ngrok.com) para obter seu token):
   ```bash
   ngrok config add-authtoken YOUR_AUTH_TOKEN
   ```

3. **Inicie o ngrok para expor o serviço**:
   ```bash
   ngrok http https://localhost:443
   ```

   O ngrok fornecerá uma URL pública (exemplo: `https://abc123.ngrok.io`). Use essa URL para acessar o n8n externamente.

---

## **Como usar este repositório**

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/seu-usuario/seu-repositorio.git
   cd seu-repositorio
   ```

2. **Execute o script de configuração**:
   O repositório inclui um script chamado `setup.sh` que automatiza a configuração do ambiente. Execute-o com o comando:
   ```bash
   bash setup.sh
   ```

   O script irá:
   - Criar o arquivo `.env` (se não existir)
   - Gerar certificados SSL autoassinados
   - Configurar os diretórios necessários
   - Iniciar os containers do Docker

3. **Acesse o n8n**:
   - **Localmente**: [https://localhost](https://localhost)
   - **Externo (via ngrok)**: Use a URL fornecida pelo ngrok (exemplo: `https://abc123.ngrok.io`)

---

## **Exportar e importar workflows**

- **Exportar workflows**:
  No n8n, abra o workflow desejado, clique no menu e selecione "Export".

- **Importar workflows**:
  No n8n, clique em "Import" e carregue o arquivo JSON do workflow.

---

## **Comandos úteis**

- **Parar os containers**:
  ```bash
  docker-compose down
  ```

- **Verificar os logs**:
  ```bash
  docker-compose logs -f
  ```

- **Recriar os containers**:
  ```bash
  docker-compose up -d --build
  ```

---

## **Licença**

Este projeto está licenciado sob a [MIT License](LICENSE).