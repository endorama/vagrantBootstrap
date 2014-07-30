vagrantBootstrap
================

Various vagrant configuration for vagrant machines!

# Setup

To install a setup install the gem `json` ( `gem install json` ).

Now simply run the `install.sh` script in the desired folder; will copy the
Vagrantfile, vagrant.json ( copy of vagrant.tpl.json ) and .vagrant folder.

```
$ curl -sSL https://raw.githubusercontent.com/endorama/vagrantBootstrap/nodejs/install.sh | bash -s nodejs
```

Edit the vagrant.json file and run `vagrant up` when ready.

Enjoy!

PS: a database has been created for you :) The name of the database can be set from `vagrant.json`
PPS: for further customization you have to edit the `.vagrant/manifest.json` file, in which are defined advanced options

# Json parse from bash

Thanks to [`jq`](http://stedolan.github.io/jq/) is possible to parse JSON from the bash bootstrap file ( example in libs/config.sh). View `jq` docs for more informations.
