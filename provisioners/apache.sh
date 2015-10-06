#!/usr/bin/env bash

APACHE_HOME=/etc/apache2

# Update and install
sudo apt-get -y -q update
sudo apt-get -q -y install apache2

# Create sites folder
#sudo mkdir -p ${APACHE_HOME}/sites-available
#sudo mkdir -p ${APACHE_HOME}/sites-enabled
#sudo rm -rf ${APACHE_HOME}/sites-available/000-default.conf
#sudo rm -rf ${APACHE_HOME}/sites-available/default-ssl.conf
#sudo cp /resources/apache/no-default ${APACHE_HOME}/sites-available/no-default
#if ! [ -a "${APACHE_HOME}/sites-enabled/no-default" ]; then
#  sudo ln -s ${APACHE_HOME}/sites-available/no-default ${APACHE_HOME}/sites-enabled/no-default
#fi

# Copy SSL certificates
# if ! [ -d "/ssl-certs" ]; then
#   sudo mkdir /ssl-certs
# fi
# sudo cp /resources/ssl-certs/* /ssl-certs
# sudo chmod 600 /ssl-certs/*.key

#sudo useradd --no-create-home nginx

# start up the server
sudo service apache2 restart

# start on restart
#sudo update-rc.d nginx defaults
