require 'spec_helper'

describe 'zenoss_register::default' do
  before do
    stub_request(:any, /.*example.*/).to_return(body: 'Device example loaded!', status: 200)
  end

  context 'zenoss_register::default registering a linux client' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'centos', version: 6.5, step_into: ['zenoss_register']) do |node|
        node.automatic['domain'] = 'example.com'
        node.automatic['hostname'] = 'example'
      end.converge(described_cookbook)
    end

    it 'registers a client with zenoss server' do
      stub_request(:any, /.*example.*/).to_return(body: 'Device example loaded!', status: 200)
      expect(chef_run).to register_zenoss_client('example')
    end
    it 'registers a client with device path /Server/Linux' do
      expect(chef_run).to register_zenoss_client('example').with(devicePath: '/Server/Linux')
    end
    it 'registers a client with productionState of 1000' do
      expect(chef_run).to register_zenoss_client('example').with(productionState: 1000)
    end
  end

  context 'zenoss_register::default registering a winnt client' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'windows', version: '2008R2', step_into: ['zenoss_register']) do |node|
        node.automatic['domain'] = 'example.com'
        node.automatic['hostname'] = 'example'
      end.converge(described_cookbook)
    end

    it 'registers a client with zenoss server' do
      stub_request(:any, /.*example.*/).to_return(body: 'Device example loaded!', status: 200)
      expect(chef_run).to register_zenoss_client('example')
    end
    it 'registers a client with device path /Server/Windows' do
      expect(chef_run).to register_zenoss_client('example').with(devicePath: '/Server/Windows')
    end
    it 'registers a client with productionState of 1000' do
      expect(chef_run).to register_zenoss_client('example').with(productionState: 1000)
    end
  end

  context 'zenoss_register::default registering a mystery client' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'chefspec', step_into: ['zenoss_register']) do |node|
        node.automatic['domain'] = 'example.com'
        node.automatic['hostname'] = 'example'
      end.converge(described_cookbook)
    end

    it 'registers a client with zenoss server' do
      stub_request(:any, /.*example.*/).to_return(body: 'Device example loaded!', status: 200)
      expect(chef_run).to register_zenoss_client('example')
    end
    it 'registers a client with device path /Server' do
      expect(chef_run).to register_zenoss_client('example').with(devicePath: '/Server')
    end
    it 'registers a client with productionState of 1000' do
      expect(chef_run).to register_zenoss_client('example').with(productionState: 1000)
    end
  end

end
