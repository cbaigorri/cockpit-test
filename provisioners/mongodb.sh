#!/usr/bin/env bash

VERSION=2.6.1

# Install MongoDB
if ! type "mongo" > /dev/null; then
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
  sudo apt-get -y -q update
  sudo apt-get -y install mongodb-org=${VERSION}
  echo "mongodb-org hold" | sudo dpkg --set-selections
fi

# Attempt to start MongoDB
if type "mongod" > /dev/null; then

  # Copy DB configuration
  sudo cp "/resources/mongodb/mongod.conf" /etc/mongod.conf
 
  # 
  sudo restart mongod

  #
  sleep 10 

  mongo admin "/resources/mongodb/admin.js"
  mongo tonto -u "administrator" -p "VBfikRmVZDx8qNF4odqrxXwyC8pVcG" --authenticationDatabase admin "/resources/mongodb/users.js"
 
else
  # 
  echo "Error installing mongodb"
  exit 1
fi
