#!/usr/bin/env bash

source libs/apache.sh
source libs/apt.sh
source libs/file.sh
source libs/mysql.sh
source libs/node.sh
source libs/php.sh

aptgetupdate
aptgetinstall git

# apache
installApache
configureVhost
webAppRoot

# php5
installPhp5
installPhp5Mysql
installComposer

# mysql
installMysql

# nodejs
installNodeJs
installNpmGlobalModules

# laravel
installLaravelDependencies
