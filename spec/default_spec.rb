require 'spec_helper'

describe 'zenoss_register::default' do

  context 'zenoss_register::default registering a linux client' do

    before do
      stub_device_post('linux')
    end

    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'centos', version: 6.5, step_into: ['zenoss_register']) do |node|
        node.automatic['domain'] = 'example.com'
        node.automatic['hostname'] = 'linux'
      end.converge(described_cookbook)
    end

    it 'registers a client with zenoss server' do
      expect(chef_run).to register_zenoss_client('linux')
    end

    it 'registers a client with device path /Server/Linux' do
      expect(chef_run).to register_zenoss_client('linux').with(devicePath: '/Server/Linux')
    end

    it 'registers a client with productionState of 1000' do
      expect(chef_run).to register_zenoss_client('linux').with(productionState: 1000)
    end
  end

  context 'zenoss_register::default registering a winnt client' do

    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'windows', version: '2008R2', step_into: ['zenoss_register']) do |node|
        node.automatic['domain'] = 'contoso.com'
        node.automatic['hostname'] = 'win-client'
      end.converge(described_cookbook)
    end

    it 'registers a client with zenoss server' do
      stub_device_post('win-client')
      expect(chef_run).to register_zenoss_client('win-client')
    end

    it 'registers a client with device path /Server/Windows' do
      stub_device_post('win-client')
      expect(chef_run).to register_zenoss_client('win-client').with(devicePath: '/Server/Windows')
    end

    it 'registers a client with productionState of 1000' do
      stub_device_post('win-client')
      expect(chef_run).to register_zenoss_client('win-client').with(productionState: 1000)
    end
  end

  context 'zenoss_register::default registering a mystery client' do

    before do
      stub_device_post('solaris')
    end

    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'chefspec', step_into: ['zenoss_register']) do |node|
        node.automatic['domain'] = 'sun.com'
        node.automatic['hostname'] = 'solaris'
      end.converge(described_cookbook)
    end

    it 'registers a client with zenoss server' do
      expect(chef_run).to register_zenoss_client('solaris')
    end
    it 'registers a client with device path /Server' do
      expect(chef_run).to register_zenoss_client('solaris').with(devicePath: '/Server')
    end
    it 'registers a client with productionState of 1000' do
      expect(chef_run).to register_zenoss_client('solaris').with(productionState: 1000)
    end
  end

end
