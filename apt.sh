# Copyright 2014 - Edoardo Tenani
# MIT License

function aptgetinstall() {
  apt-get install -y $@
}

function aptgetupdate() {
  apt-get update
}
