# Minecraft Server Notification System

## このシステムについて

MinecraftサーバをDockerコンテナ上で管理するシステムです。  
SlackやDiscordなどのチャットツール経由でサーバの稼働状況を知ることができます。

## 使用技術

- api
  - Ruby
  - Sinatra
  - MySQL
- fluentd
  - Fluentd
  - MySQL
- worker
  - Ruby
  - clockwork
- slackbot
  - Ruby
- discordbot
  - Ruby
- scripts
  - Bash
- other
  - Makefile
  - Docker
  - Docker Compose

## 使い方

### 初期設定

api, fluentd, worker, slackbot, discordbot, slackbot, scriptsそれぞれに.envファイルを作成します。  
.env.sampleを.envにコピーして設定を行ってください。

```
cp .env.sample .env
```

初期設定を行います。  
以下のコマンドを実行すれば完了です。

```
make setup
```

### 起動

```
make build
docker-compose up
```
