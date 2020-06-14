#!/bin/env bash

eval "$(cat ./.env <(echo) <(declare -x))"

build() {
  git pull origin master
  docker-compose build
}

env() {
  echo "API_URL:" $API_URL
  echo "API_PORT:" $API_PORT
  echo "API_TOKEN:" $API_TOKEN
  echo "SLACK_BOT_TOKEN:" $SLACK_BOT_TOKEN
  echo "DISCORD_BOT_CLIENT_ID:" $DISCORD_BOT_CLIENT_ID
  echo "DISCORD_BOT_TOKEN:" $DISCORD_BOT_TOKEN
  echo "MINECRAFT_VERSION:" $MINECRAFT_VERSION
  echo "MYSQL_ROOT_PASSWORD:" $MYSQL_ROOT_PASSWORD
  echo "MYSQL_HOST:" $MYSQL_HOST
  echo "MYSQL_PORT:" $MYSQL_PORT
  echo "MYSQL_DATABASE:" $MYSQL_DATABASE
  echo "MYSQL_USER:" $MYSQL_USER
  echo "MYSQL_PASSWORD:" $MYSQL_PASSWORD
}

# 実行時引数による条件分岐
case "$1" in
  build)
    build
    ;;
  env)
    env
    ;;
esac