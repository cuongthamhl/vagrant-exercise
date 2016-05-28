#!/usr/bin/env bash

# @param: name of the DB
args_db_name=dev

# @param: username of the DB user
args_db_user=dev

# @param: password of the DB user
args_db_pass=dev

# @param: allowed hostname
args_db_host=*


# suppress prompts
export DEBIAN_FRONTEND=noninteractive

sudo apt-get install -y mysql-client
sudo -E apt-get install -qq mysql-server 

# create database
mysql -uroot -e "create database ${args_db_name};"

# create user, and grant all permissions to new DB
mysql -uroot -e "grant all privileges on ${args_db_name}.* to '${args_db_user}'@'${args_db_host}' identified by '${args_db_pass}';"

