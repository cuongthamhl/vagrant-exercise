#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update

sudo apt-get -y install htop
sudo apt-get -y install nginx

sudo /vagrant/provisioner/mysql.sh

sudo apt-get -y install php5-fpm php5-cli php5-mysql
sed -i -e s/';cgi.fix_pathinfo=1'/'cgi.fix_pathinfo=0'/ /etc/php5/fpm/php.ini

if [ -f "/etc/nginx/sites-enabled/default" ]
then
  sudo rm /etc/nginx/sites-enabled/default
fi

sudo cp /vagrant/provisioner/nginx/site.conf /etc/nginx/sites-enabled/site.conf

# install composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

sudo service php5-fpm restart
sudo service nginx restart
