# Copyright 2014 - Edoardo Tenani
# MIT License

source /vagrant/.vagrant/libs/file.sh

function copyBashRc() {
  copy "home/vagrant/.bashrc"
}

function copyBashFunctions() {
  copy "home/vagrant/.bash_functions"
}
