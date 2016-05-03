# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.network "private_network", ip: "55.55.55.5"

  config.vm.provision :ansible do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.sudo = true
  end
end
