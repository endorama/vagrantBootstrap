vagrantBootstrap
================

Various vagrant configuration for vagrant machines!

Currently supported machines:
- laravel machine ( php5, mysql, nodejs, npm, grunt, bower, yeoman)

# Setup

To install a setup install the gem `json` ( `gem install json` ).

Then create a vagrant.json in the folder in which you want your create the machine
using this template:

```json
{
  "name": "default",
  "cpu": 1,
  "ram": 512
}
```
