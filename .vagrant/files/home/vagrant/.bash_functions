myip () {
  ifconfig eth1 | grep -w 'inet' | sed -e 's/:/ /' | awk '{print "Vagrant machine address is : " $3}'
}
