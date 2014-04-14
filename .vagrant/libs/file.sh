# Copyright 2014 - Edoardo Tenani
# MIT License

function setPermissions() {
  chmod +x /usr/local/bin/jq
}

function copyAll() {
  for file in $(ls /vagrant/.vagrant/files); do
    echo "Copying $file"
    cp cp -r /vagrant/.vagrant/files/$file /
  done

  setPermissions
}

function copy() {
  local file=$1

  cp /vagrant/.vagrant/files/$1 /$1
}
