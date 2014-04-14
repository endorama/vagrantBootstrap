#!/usr/bin/env bash

vagrant_root="/vagrant/.vagrant"

source $vagrant_root/libs/apache.sh
source $vagrant_root/libs/apt.sh
source $vagrant_root/libs/file.sh
source $vagrant_root/libs/mysql.sh
source $vagrant_root/libs/node.sh
source $vagrant_root/libs/php.sh

aptgetupdate
aptgetinstall git

# copy jq executable
copy 'usr/local/bin/jq'
chmod +x '/usr/local/bin/jq'

# apache
installApache
configureVhost
webAppRoot

# php5
installPhp5
installPhp5Mysql
installComposer

# mysql
configureMysql
installMysql
createDatabase

# nodejs
installNodeJs
installNpmGlobalModules

# laravel
installLaravelDependencies
