vagrantBootstrap
================

Various vagrant configuration for vagrant machines!

Currently supported machines:
- laravel machine ( php5, mysql, nodejs, npm, grunt, bower, yeoman)

The master branch should be only a catch up for all available configurations.

# Setup

To install a setup install the gem `json` ( `gem install json` ).

Now simply run the `install.sh` script in the desired folder; will copy the
Vagrantfile, vagrant.json ( copy of vagrant.tpl.json ) and .vagrant folder.

```
$ branch={branch_name}
$ curl -sSL https://raw.githubusercontent.com/endorama/vagrantBootstrap/$branch/install.sh | bash -s $branch
```

Edit the vagrant.json file and run `vagrant up` when ready.

Enjoy!
