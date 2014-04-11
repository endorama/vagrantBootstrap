vagrantBootstrap
================

Various vagrant configuration for vagrant machines!

Currently supported machines:
- laravel machine ( php5, mysql, nodejs, npm, grunt, bower, yeoman)

# Setup

To install a setup install the gem `json` ( `gem install json` ).

Now simply run the `install.sh` script in the desired folder; will copy the
Vagrantfile, vagrant.json ( copy of vagrant.tpl.json ) and .vagrant folder.

```
$ curl -sSL https://raw.githubusercontent.com/endorama/vagrantBootstrap/laravel/install.sh | bash -s laravel

Edit the vagrant.json file and run `vagrant up` when ready.

Enjoy!
