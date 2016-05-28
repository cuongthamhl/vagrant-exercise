#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
