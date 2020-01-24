# Minecraft Server Notification System

## このシステムについて

MinecraftサーバをDockerコンテナ上で管理するシステムです。
Minecraftサーバを管理するためのAPIサーバも同梱されています。

## APIサーバのアクセス制御

APIサーバはIPアドレスによる、アクセス制御機能があります。
アクセスを許可したいIPアドレスを.envの `ALLOW_HOST` に指定することで、
そのホストからのみAPIへのアクセスを受け付けます。
アクセス制御を行わない場合は、 `ALLOW_HOST` に `0.0.0.0` を指定してください。

## 使用技術

- Bash
- Ruby
- Sinatra
- Docker
- Docker Compose

## 使い方

### 初期設定

まず、.envファイルを作成します。.env.sampleをコピーして.envの設定を行ってください。

```
cp .env.sample .env
```

次に、コンテナの用意を行います。

```
docker-compose build
```

### 起動

Docker Composeを使って起動します。

```
docker-compose up
```
