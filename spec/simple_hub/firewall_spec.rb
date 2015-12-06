# To avoid serverspec and infrataster_firewall conflict of reachable? method
# spec_helper is separated
require 'spec_helper_it'

describe server(:'192.168.8.6') do
  describe firewall(server(:'192.168.8.7')) do
    it { is_expected.to be_reachable }
    it { is_expected.to be_reachable.dest_port(80) }
    it { is_expected.to be_reachable.tcp.dest_port(80) }
  end
end
