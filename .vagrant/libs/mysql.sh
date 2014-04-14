# Copyright 2014 - Edoardo Tenani
# MIT License

source /vagrant/.vagrant/libs/apt.sh

function configureMysql() {
  local username=$(jq ".provision.database.username" /vagrant/vagrant.json)
  local password=$(jq ".provision.database.password" /vagrant/vagrant.json)

  debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password password $username"
  debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password_again password $password"
}

function installMysql() {
  aptgetinstall mysql-server
}

function createDatabase() {
  local username=$(jq ".provision.database.username" /vagrant/vagrant.json)
  local password=$(jq ".provision.database.password" /vagrant/vagrant.json)
  local name=$(jq ".provision.database.name" /vagrant/vagrant.json)

  mysql -u $username -p$password -e "create database $name;"
}
