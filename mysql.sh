# Copyright 2014 - Edoardo Tenani
# MIT License

source /vagrant/.vagrant/libs/apt.sh
source /vagrant/.vagrant/libs/config.sh

function configureMysql() {
  local password=$(getConfig ".database.password")

  debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password password $password"
  debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password_again password $password"
}

function installMysql() {
  aptgetinstall mysql-server
}

function createDatabase() {
  local name=$1
  local password=$(getConfig ".database.password")
  
  mysql -u root -p$password -e "create database $name;"
}

function configureMysqlWorkbench() {
  #Grant privileges to remote user to connect from remote MySQLWorkBench session
  mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'10.0.2.2';"

  #Make MySQL accessible from remote software (i.e. MySQLWorkbench)
  sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf
}
