# -*- mode: ruby -*-
# vi: set ft=ruby :

default_box = "generic/ubuntu2204"
# box_version = "v4.0.2"

# default_box = "opensuse/Leap-15.2.x86_64"
# box_version = "15.2.31.309"
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.require_version ">= 2.2.10"
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  # Use any version between 15.2.31.300 and 15.2.31.570
  config.vm.define "observability" do |observability|
    observability.vm.box = default_box
#    observability.vm.box_version = box_version
    observability.vm.hostname = "observability"
    observability.vm.network 'private_network', ip: "192.168.10.11",  virtualbox__intnet: true
    observability.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh", disabled: true
    observability.vm.network "forwarded_port", guest: 22, host: 2000 # Master Node SSH
    observability.vm.network "forwarded_port", guest: 6443, host: 6443 # API Access
    observability.vm.network "forwarded_port", guest: 3000, host: 3000 # Grafana Access
    observability.vm.network "forwarded_port", guest: 9090, host: 9090 # Prometheus GUI

    # Application specific ports required
    #config.vm.network "forwarded_port", guest: 80, host: 8080
    #config.vm.network "forwarded_port", guest: 9090, host: 9090
    #config.vm.network "forwarded_port", guest: 8080, host: 8080
    #config.vm.network "forwarded_port", guest: 8888, host: 8080 
    #config.vm.network "forwarded_port", guest: 9090, host: 8888
    #config.vm.network "forwarded_port", guest: 3030, host: 3030
    #config.vm.network "forwarded_port", guest: 8080, host: 8080
    #config.vm.network "forwarded_port", guest: 16686, host: 8088
    #config.vm.network "forwarded_port", guest: 8000, host: 8888
    #config.vm.network "forwarded_port", guest: 8888, host: 8888
    #config.vm.network "forwarded_port", guest: 8000, host: 8000
  
    #for p in 30000..30100 # expose NodePort IP's
      #observability.vm.network "forwarded_port", guest: p, host: p, protocol: "tcp"
    #end

    observability.vm.provider "virtualbox" do |vb|
      vb.memory = "8192"
      vb.name = "observability"
      vb.gui = true
    end
    
    observability.vm.synced_folder "C:/Users/Michael.Volkmann2/Documents/tools/vagrant/shared", "/vagrant-shared", type: "virtualbox" 
    
    if Vagrant.has_plugin?("vagrant-proxyconf")
      observability.proxy.http = "http://192.168.56.1:3128"
      observability.proxy.https = "http://192.168.56.1:3128"
      observability.proxy.no_proxy = "localhost,127.0.0.1,10.43.0.0/16"
    end

    if Vagrant.has_plugin?("vagrant-vbguest") then
      observability.vbguest.auto_update = false
    end
    observability.vbguest.no_remote = true  

    # Copy private key to VM for Git and other tools
    # observability.vm.provision 'file', source: "#{ENV['HOME']}/.ssh/id_rsa", destination: '~/.ssh/id_rsa'

    observability.vm.provision 'shell', privileged: false, path: 'provision/bzip2.sh', name: 'bzip2.sh'
    observability.vm.provision 'shell', privileged: false, path: 'provision/etcd.sh', name: 'etcd.sh'
    observability.vm.provision 'shell', privileged: false, path: 'provision/apparmor-profiles.sh', name: 'apparmor-profiles.sh'
    observability.vm.provision 'shell', privileged: false, path: 'provision/xfce4.sh', name: 'xfce4.sh'
    observability.vm.provision 'shell', privileged: false, path: 'provision/google-chrome.sh', name: 'google-chrome.sh'
    observability.vm.provision 'shell', privileged: false, path: 'provision/k3s.sh', name: 'k3s.sh'
    observability.vm.provision 'shell', privileged: false, path: 'provision/helm.sh', name: 'helm.sh'
    
  end
end