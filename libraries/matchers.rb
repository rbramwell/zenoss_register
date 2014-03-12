# Matchers for chefspec
#
if defined?(ChefSpec)
  def register_zenoss_client(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:zenoss_register, :register, resource_name)
  end
end

