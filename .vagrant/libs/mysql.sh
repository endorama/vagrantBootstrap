# Copyright 2014 - Edoardo Tenani
# MIT License

source /vagrant/.vagrant/libs/apt.sh

function configureMysql() {
  debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'
  debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'
}

function installMysql() {
  aptgetinstall mysql-server
}
