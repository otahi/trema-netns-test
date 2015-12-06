require 'net/ssh'
require 'infrataster/rspec'
require 'infrataster-plugin-firewall'

Infrataster::Server.define(:'192.168.8.6') do |s|
  s.address = '192.168.8.6'
  s.ssh = Net::SSH::Config.for(s.address)
end
Infrataster::Server.define(:'192.168.8.7') do |s|
  s.address = '192.168.8.7'
  s.ssh = Net::SSH::Config.for(s.address)
end
