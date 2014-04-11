# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'json'

# Read configuration from a vagrant.json file
config = JSON.parse(IO.read('vagrant.json'))

VAGRANT_NAME = config['name']
VIRTUALBOX_CPU = config['cpu']
VIRTUALBOX_RAM = config['ram']

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # see http://stackoverflow.com/a/20431791/715002
  config.vm.define VAGRANT_NAME do |machine|
    # Every Vagrant virtual environment requires a box to build off of.
    machine.vm.box = "debian-7.4"

    # The url from where the 'config.vm.box' box will be fetched if it
    # doesn't already exist on the user's system.
    machine.vm.box_url = "https://vagrantcloud.com/chef/debian-7.4/version/1/provider/virtualbox.box"

    # Tell vagrant to run boostrap.sh in shell when provisioning
    machine.vm.provision :shell, :path => ".vagrant/bootstrap.sh"

    # Bridged networking
    machine.vm.network :public_network

    config.vm.network "forwarded_port", guest: 35729, host: 35729

    # Set machine hostname
    machine.vm.hostname = VAGRANT_NAME

    # If true, then any SSH connections made will enable agent forwarding.
    # Default value: false
    # config.ssh.forward_agent = true

    # Share an additional folder to the guest VM. The first argument is
    # the path on the host to the actual folder. The second argument is
    # the path on the guest to mount the folder. And the optional third
    # argument is a set of non-required options.
    config.vm.synced_folder ".", "/vagrant",
      id: "vagrant-root",
      owner: "vagrant",
      group: "www-data",
      mount_options: ["dmode=775,fmode=664"]
  end

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider :virtualbox do |vb|
    vb.name = VAGRANT_NAME

    # Don't boot with headless mode
    # vb.gui = true

    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", '1024']
    vb.customize ["modifyvm", :id, "--cpus", '2']
  end

end
