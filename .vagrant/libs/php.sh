# Copyright 2014 - Edoardo Tenani
# MIT License

source /vagrant/.vagrant/libs/apt.sh

function installPhp5() {
  aptgetinstall php5
}

function installPhp5Mysql() {
  aptgetinstall php5-mysql
}

function installComposer() {
  curl -sS https://getcomposer.org/installer | php
  mv composer.phar /usr/local/bin/composer
}

function installLaravelDependencies() {
  aptgetinstall unzip curl openssl php5-mcrypt
}
