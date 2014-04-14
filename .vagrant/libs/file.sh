# Copyright 2014 - Edoardo Tenani
# MIT License

function setPermissions() {
}

function copyAll() {
  for file in $(ls /vagrant/.vagrant/files); do
    echo "Copying $file"
    cp $file /
  done

  setPermissions
}

function copy() {
  local file=$1

  cp /vagrant/.vagrant/files/$1 /$1
}
