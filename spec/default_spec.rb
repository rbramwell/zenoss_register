require 'spec_helper'

describe 'zenoss_register::default' do
  context 'zenoss_register::default registering client' do
    let(:chef_run) do 
      ChefSpec::Runner.new(platform: 'centos', version: 6.5, step_into: ['zenoss_register']) do |node|
        node.automatic['domain'] = 'marshall.edu'
        node.set['zenoss_register']['username'] = 'admin'
        node.set['zenoss_register']['password'] = 'pass'
        node.set['zenoss_register']['baseuri'] = 'http://zen02.marshall.edu:8080'
      end.converge(described_cookbook)
    end

    it 'registers a client with zenoss server' do
      expect(chef_run).to register_zenoss_client('example')
    end
  end
end
