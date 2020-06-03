# Minecraft Server Notification System

## このシステムについて

MinecraftサーバをDockerコンテナ上で管理するシステムです。
サーバの状態を管理し、API経由で状態をお知らせします。

## APIサーバのアクセス制御

APIサーバはIPアドレスによる、アクセス制御機能があります。
アクセスを許可したいIPアドレスを.envの `ALLOW_HOST` に指定することで、
そのホストからのみAPIへのアクセスを受け付けます。
アクセス制御を行わない場合は、 `ALLOW_HOST` に `0.0.0.0` を指定してください。

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
各プロジェクト内で.env.sampleをコピーして.envの設定を行ってください。

```
cp .env.sample .env
```

Minecraftサーバをダウンロードします。

```
make setup
```

### 起動

```
make start
```
