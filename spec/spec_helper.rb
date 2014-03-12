require 'chefspec'
require 'chefspec/berkshelf'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.formatter = :documentation
  config.color_enabled = true
end

at_exit { ChefSpec::Coverage.report! }
