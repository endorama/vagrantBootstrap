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


# nodejs
installNodeJsBin
installNpmGlobalModules

### CUSTOM MACHINE SETTINGS ####################################################
if [ ! -f $vagrant_root/provision.sh ];
    then echo "### Missing provision.sh file. Base machine built. ###"
else
    echo "### CUSTOM MACHINE INSTALL...###"
    source $vagrant_root/provision.sh
fi
