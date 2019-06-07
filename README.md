# Minecraft Server Notification System

## このシステムについて

Minecraft サーバを Docker コンテナ上で管理し、サーバを agent/dashboard による監視が行えるシステムです。

## Requirements

- Node.js
- Express
- Scoket.io
- Nginx
- Docker
- Docker Compose

## 使い方

### 初回起動

```
bash init.sh
docker-compose build
```

### Server 実行

```
docker-compose up dashboard
```

### Agent 実行

```
docker-compose up agent mc_server
```
