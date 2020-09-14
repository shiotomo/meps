#!/bin/env bash

file=./minecraft/server.jar

eval "$(cat .env <(echo) <(declare -x))"

# .envの配布
echo "copy .env"
echo "cp ./.env ./api/.env"
cp ./.env ./api/.env
echo "cp ./.env ./slackbot/.env"
cp ./.env ./slackbot/.env
echo "cp ./.env ./discordbot/.env"
cp ./.env ./discordbot/.env
echo "cp ./.env ./fluentd/.env"
cp ./.env ./fluentd/.env
echo "cp ./.env ./worker/.env"
cp ./.env ./worker/.env
echo "complete copy .env !!"

# Minecraftサーバ周りの処理
if [ -e $file ]; then
  echo "Found !!"
  exit
fi

if [ "$MINECRAFT_VERSION" = "1.14" ]; then
  echo 'Install Version 1.14'
  wget -P ./minecraft https://launcher.mojang.com/v1/objects/f1a0073671057f01aa843443fef34330281333ce/server.jar
  echo "Complete !!"
elif [ "$MINECRAFT_VERSION" = "1.15" ]; then
  echo 'Install Version 1.15'
  wget -P ./minecraft https://launcher.mojang.com/v1/objects/4d1826eebac84847c71a77f9349cc22afd0cf0a1/server.jar
  echo "Complete !!"
elif [ "$MINECRAFT_VERSION" = "1.15.2" ]; then
  echo 'Install Version 1.15.2'
  wget -P ./minecraft https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar
  echo "Complete !!"
elif [ "$MINECRAFT_VERSION" = "1.16.1" ]; then
  echo 'Install Version 1.16.1'
  wget -P ./minecraft https://launcher.mojang.com/v1/objects/a412fd69db1f81db3f511c1463fd304675244077/server.jar
  echo "Complete !!"
elif [ "$MINECRAFT_VERSION" = "1.16.2" ]; then
  echo 'Install Version 1.16.2'
  wget -P ./minecraft https://launcher.mojang.com/v1/objects/c5f6fb23c3876461d46ec380421e42b289789530/server.jar
  echo "Complete !!"
else
  echo '.envのMINECRAFT_VERSIONが無効です。'
  exit 1
fi
