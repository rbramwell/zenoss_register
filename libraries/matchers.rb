# Matchers for chefspec
#
#
# This is not a reusable matcher. You will need to stub a custom response
# Example Response for confirming the device was loaded:
#  stub_request(:any, /.*example.*/).to_return(:body => "Device example loaded!", :status => 200)
#

if defined?(ChefSpec)
  def register_zenoss_client(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:zenoss_register, :register, resource_name)
  end
end
