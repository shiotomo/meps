#!/bin/bash

file=./minecraft/server.jar

eval "$(cat .env <(echo) <(declare -x))"

if [ -e $file ]; then
  echo "Found !!"
  exit
fi

if [ "$MINECRAFT_VERSION" = "1.15" ]; then
  echo 'Install Version 1.15'
  wget -P ./minecraft https://launcher.mojang.com/v1/objects/4d1826eebac84847c71a77f9349cc22afd0cf0a1/server.jar
  echo "Complete !!"
elif [ "$MINECRAFT_VERSION" = "1.15.2" ]; then
  echo 'Install Version 1.15.2'
  wget -P ./minecraft https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar
  echo "Complete !!"
elif [ "$MINECRAFT_VERSION" = "1.14" ]; then
  echo 'Install Version 1.14'
  wget -P ./minecraft https://launcher.mojang.com/v1/objects/f1a0073671057f01aa843443fef34330281333ce/server.jar
  echo "Complete !!"
else
  echo '.envのMINECRAFT_VERSIONが無効です。'
  exit 1
fi
