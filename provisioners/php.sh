#!/usr/bin/env bash

# Update and install
sudo apt-get -y -q update
sudo apt-get -y -q install php5
sudo apt-get -y -q install libapache2-mod-php5
sudo apt-get -y -q install php5-mcrypt
sudo apt-get -y -q install php5-mysql
sudo apt-get -y -q install php5-gd
sudo apt-get -y -q install sqlite3 libsqlite3-dev
sudo apt-get -y -q install php5-sqlite
