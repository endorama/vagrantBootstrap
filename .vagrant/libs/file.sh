# Copyright 2014 - Edoardo Tenani
# MIT License

function copy_all() {
  for file in $(ls files); do
    cp $file /
  done
}

function copy() {
  local file=$1

  cp /vagrant/.vagrant/files/$1 /$1
}
