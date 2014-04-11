# Copyright 2014 - Edoardo Tenani
# MIT License

source apt.sh

function installNodeJs() {
  aptgetinstall python g++ make checkinstall

  src=$(mktemp -d) && cd $src

  wget -N http://nodejs.org/dist/v0.10.26/node-v0.10.26.tar.gz
  tar xzvf node-v0.10.26.tar.gz && cd node-v*

  ./configure
  fakeroot checkinstall -y --install=no --pkgversion $(echo $(pwd) | sed -n -re's/.+node-v(.+)$/\1/p') make -j$(($(nproc)+1)) install
  sudo dpkg -i node_*
}

function installNpm() {
  curl --insecure https://www.npmjs.org/install.sh | bash
}

function installNpmGlobalModules() {
  npm install -g grunt-cli
  npm install -g bower
  npm install -g yeoman
}
