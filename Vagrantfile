# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|

  config.vm.define "puppet-master" do |box|
    box.vm.hostname = "puppet-master"
    box.vm.network "private_network", ip: "10.1.1.4"
    box.vm.provision "shell" do |s|
      s.path = "box-scripts/base"
      s.args = "puppet-master"
    end
    box.vm.box = "puppetlabs/centos-7.0-64-nocm"
  end
  config.vm.define "jenkins-master" do |box|
    box.vm.hostname = "jenkins-master"
    box.vm.network "private_network", ip: "10.1.1.5"
    box.vm.network "forwarded_port", guest: 8080, host: 8080
    box.vm.provision "shell" do |s|
      s.path = "box-scripts/base"
    end
    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1048"]
        vb.customize ["modifyvm", :id, "--cpus", "1"]
    end
    box.vm.box = "puppetlabs/centos-6.6-64-nocm"
  end

end
