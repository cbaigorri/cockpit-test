# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

# Directory where applications will be installed
APPS_HOME = "/home/apps"
APP_URL = "dev.cockpittest.com"

# Vagrant configuration
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "trusty64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # Configure VM Ram usage
  config.vm.provider "virtualbox" do |vbox|
    vbox.memory = 4096
    vbox.cpus = 1

    vbox.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000 ]
  end

  ###
  # Configure development VM
  ###
  config.vm.define "dev", primary: true do |dev|

    dev.vm.network :private_network, ip: "172.16.0.10", :netmask => "255.255.0.0"

    # Resources
    dev.vm.synced_folder "./resources", "/resources"

    # Applications
    dev.vm.synced_folder "./app/", "#{APPS_HOME}/#{APP_URL}/current",
      owner: "vagrant",
      group: "www-data",
      mount_options: ['dmode=777','fmode=777']

    # Web stack provisioners
    dev.vm.provision "shell", path: "provisioners/bootstrap.sh"
    dev.vm.provision "shell", path: "provisioners/apache.sh"
#    dev.vm.provision "shell", path: "provisioners/nginx.sh"
#    dev.vm.provision "shell", path: "provisioners/node.sh"

    dev.vm.provision "shell", path: "provisioners/app-apache.sh", args: ["#{APP_URL}"]
#    dev.vm.provision "shell", path: "provisioners/app.sh", args: ["#{APP_URL}"]
    dev.vm.provision "shell", path: "provisioners/hosts.sh", args: ["#{APP_URL}"]
    dev.vm.provision "shell", path: "provisioners/openports.sh", args: ["80"]
  end

end
