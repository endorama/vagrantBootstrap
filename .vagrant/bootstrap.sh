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

#Create required db tables using NodeJS
node /vagrant/oauth-server/database/create_db.js cortana
node /vagrant/resource-server/database/create_db.js cortana

#Install required NodeJS modules
cd /vagrant/oauth-server && npm install
cd /vagrant/resource-server && npm install
