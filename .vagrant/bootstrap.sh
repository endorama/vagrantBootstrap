#!/usr/bin/env bash

vagrant_root="/vagrant/.vagrant"

source $vagrant_root/libs/config.sh

source $vagrant_root/libs/apt.sh
source $vagrant_root/libs/bashrc.sh
source $vagrant_root/libs/mysql.sh
source $vagrant_root/libs/node.sh

aptgetupdate

copyBashRc
copyBashFunctions

# mysql
configureMysql 
installMysql
oauth_name=$(getConfig ".database_oauth.name")
createDatabase $oauth_name
resource_name=$(getConfig ".database_resource.name")
createDatabase $resource_name
configureMysqlWorkbench

# nodejs
installNodeJsBin
installNpmGlobalModules

### CUSTOM MACHINE SETTINGS ####################################################

#Create required db tables
oauth_db_name=$(getConfig '.database_oauth.name')
oauth_db_passwd=$(getConfig '.database.password')
for i in $(ls /vagrant/oauth-server/database/sql); do
  echo "Dumping $i into $oauth_db_name"
  mysql -u root -p$oauth_db_passwd $oauth_db_name < oauth-server/database/sql/$i
done

oauth_db_name=$(getConfig '.database_resource.name')
oauth_db_passwd=$(getConfig '.database.password')
for i in $(ls /vagrant/resource-server/database/sql); do
  echo "Dumping $i into $oauth_db_name"
  mysql -u root -p$oauth_db_passwd $oauth_db_name < resource-server/database/sql/$i
done

#Install required NodeJS modules
cd /vagrant/oauth-server && npm install
cd /vagrant/resource-server && npm install
