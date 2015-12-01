# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.synced_folder('.', '/home/vagrant/trema',
                          type: 'rsync', rsync__exclude: 'vendor')

  if Vagrant.has_plugin?('vagrant-proxyconf') && ENV['http_proxy']
    config.proxy.http     = ENV['http_proxy']
    config.proxy.https    = ENV['https_proxy']
    config.proxy.no_proxy = ENV['no_proxy']
  end

  config.vm.provision 'shell', inline: <<-SHELL
    apt-get update
    apt-get install software-properties-common
    apt-add-repository ppa:brightbox/ruby-ng -y
    apt-get update
    apt-get install ruby2.2 ruby2.2-dev -y
    apt-get install build-essential git -y
    apt-get install openvswitch-switch -y
    gem install bundler
  SHELL

  config.vm.provision 'shell', privileged: false, inline: <<-SHELL
    cd trema
    test -d repeater_hub || git clone https://github.com/trema/repeater_hub.git
    cd repeater_hub
    bundle install --path=vendor/bundle --binstubs
  SHELL
end
