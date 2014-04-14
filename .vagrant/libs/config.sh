# Copyright 2014 - Edoardo Tenani
# MIT License

source /vagrant/.vagrant/libs/file.sh

# copy jq executable
copy 'usr/local/bin/jq'
chmod +x '/usr/local/bin/jq'

function getConfig() {
  local temp=$(jq $1 /vagrant/vagrant.json)
  
  # http://stackoverflow.com/a/9733456/715002
  # strip last "
  temp="${temp%\"}"
  # strip first "
  temp="${temp#\"}"
  # return cleaned string
  echo "$temp"
}
