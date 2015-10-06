#!/usr/bin/env bash

APACHE_HOME=/etc/apache2

for DOMAIN in "$@"
do

  CONFIG_PATH="/resources/app/apache.conf"
  DOMAIN_CONFIG="include $CONFIG_PATH;"

  if [ -a $CONFIG_PATH ]; then

    if [ -a "${APACHE_HOME}/sites-available/${DOMAIN}" ]; then
      sudo rm ${APACHE_HOME}/sites-available/${DOMAIN}
    fi
    sudo echo -e "$DOMAIN_CONFIG" >> ${APACHE_HOME}/sites-available/${DOMAIN}

    if ! [ -a "${APACHE_HOME}/sites-enabled/${DOMAIN}" ]; then
      sudo ln -s ${APACHE_HOME}/sites-available/${DOMAIN} ${APACHE_HOME}/sites-enabled/${DOMAIN}
    fi

    sudo a2ensite ${DOMAIN}.conf

  fi


  cd /home/apps/${DOMAIN}/current/
  npm install
done

sudo service apache2 restart
