#!/bin/bash

file=server.jar

if [ -e $file ]; then
  echo "Found !!"
else
  echo "Install server.jar !!"
  wget -P . https://launcher.mojang.com/v1/objects/f1a0073671057f01aa843443fef34330281333ce/server.jar
fi
