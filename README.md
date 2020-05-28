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

- Ruby
- Sinatra
- Bash
- Docker
- Docker Compose
- MySQL
- Fluentd

## 使い方

### 初期設定

.envファイルを作成します。
.env.sampleをコピーして.envの設定を行ってください。

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
