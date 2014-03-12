require 'chefspec'
require 'chefspec/berkshelf'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

def stub_device_post(hostname='example')
  stub_request(:any, /.*/).to_return(body: "Device #{hostname} loaded!", status: 200)
end

RSpec.configure do |config|
  config.formatter = :documentation
  config.color_enabled = true
end

at_exit { ChefSpec::Coverage.report! }
