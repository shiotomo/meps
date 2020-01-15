#!/bin/bash

file=server.jar

if [ -e $file ]; then
  echo "Found !!"
else
  echo "Install server.jar !!"
  # v1.14
  # wget -P . https://launcher.mojang.com/v1/objects/f1a0073671057f01aa843443fef34330281333ce/server.jar

  # v1.15
  wget -P . https://launcher.mojang.com/v1/objects/4d1826eebac84847c71a77f9349cc22afd0cf0a1/server.jar
fi
