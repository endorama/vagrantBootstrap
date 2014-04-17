# Copyright 2014 - Edoardo Tenani
# MIT License

source /vagrant/.vagrant/libs/apt.sh
source /vagrant/.vagrant/libs/copy.sh

function _restartApache() {
  /etc/init.d/apache2 restart
}

function installApache() {
  aptgetinstall apache2
  a2enmod rewrite
  _restartApache
}

function webAppRoot() {
  # remove standard www
  rm -rf /var/www
  # link current folder ( synced folder ) with www as webserver document root
  ln -fs /vagrant /var/www
}

function configureVhost() {
  copy "etc/apache2/sites-available/default"
  _restartApache
}
