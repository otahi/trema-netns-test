require 'spec_helper'

describe interface('nshost1') do
  it { should exist }
end

describe host('192.168.8.7') do
  it { should be_reachable }
end
