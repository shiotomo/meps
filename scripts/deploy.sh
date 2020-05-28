#!/bin/env bash

eval "$(cat .env <(echo) <(declare -x))"

build() {
  git pull origin master
  docker-compose build
}

stop() {
  docker-compose stop
}

start() {
  build
  docker-compose up -d
}

restart() {
  stop
  build
  start
}

env() {
  echo "ALLOWHOST:" $ALLOW_HOST
  echo "PORT:" $PORT
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
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    restart
    ;;
  env)
    env
    ;;
esac