# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|

  config.vm.define "puppet-master" do |box|
    box.vm.hostname = "puppet-master"
    box.vm.network "private_network", ip: "10.1.1.4"
    box.vm.network "forwarded_port", guest: 80, host: 80, auto_correct: true
    box.vm.provider "virtualbox" do |v|
        v.memory = 1024
    end
    box.vm.provision "shell" do |s|
      s.path = "box-scripts/base"
      s.args = "puppet-master"
    end
    box.vm.box = "puppetlabs/centos-7.0-64-nocm"
  end

  config.vm.define "jenkins-master" do |box|
    box.vm.hostname = "jenkins-master"
    box.vm.network "private_network", ip: "10.1.1.5"
    box.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true
    box.vm.provision "shell" do |s|
      s.path = "box-scripts/base"
    end
    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1048"]
        vb.customize ["modifyvm", :id, "--cpus", "1"]
    end
    box.vm.box = "puppetlabs/centos-7.0-64-nocm"
  end

  config.vm.define "foreman" do |box|
    box.vm.hostname = "foreman"
    box.vm.network "private_network", ip: "10.1.1.6"
    box.vm.provision "shell" do |s|
      s.path = "box-scripts/base"
    end
    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", "1048"]
        vb.customize ["modifyvm", :id, "--cpus", "1"]
    end
    box.vm.box = "puppetlabs/centos-7.0-64-nocm"
  end

  config.vm.define "cent7" do |box|
    box.vm.hostname = "cent7"
    box.vm.network "private_network", ip: "10.1.1.8"
    box.vm.provision "shell" do |s|
      s.path = "box-scripts/base"
    end
    box.vm.box = "puppetlabs/centos-7.0-64-nocm"
  end

  config.vm.define "trusty" do |box|
    box.vm.hostname = "trusty"
    box.vm.network "private_network", ip: "10.1.1.9"
    box.vm.provision "shell" do |s|
      s.path = "box-scripts/base"
    end
    box.vm.box = "ubuntu/trusty64"
  end

  config.vm.define "jessie" do |box|
    box.vm.hostname = "jessie"
    box.vm.network "private_network", ip: "10.1.1.10"
    box.vm.provision "shell" do |s|
      s.path = "box-scripts/base"
    end
    box.vm.box = "debian/jessie64"
  end

  config.vm.define "ganglia-master" do |box|
    box.vm.hostname = "ganglia-master"
    box.vm.network "private_network", ip: "10.1.1.11"
    box.vm.network "forwarded_port", guest: 80, host: 80, auto_correct: true
    box.vm.provision "shell" do |s|
      s.path = "box-scripts/base"
    end
    box.vm.box = "puppetlabs/centos-7.0-64-nocm"
  end

end
