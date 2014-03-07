action :register do
  Chef::Log.info("Current Zenoss Client Registration Status: #{node['zenoss-client']['registered']}")
  unless node['zenoss-client']['registered']

    Chef::Log.info("Registering node with zen server #{new_resource}")

        require 'net/http'
        base_uri = "#{new_resource.baseuri}"
	base_uri = base_uri + "/zport/dmd/DeviceLoader?"
        post_uri = "deviceName=#{new_resource.hostname}&devicePath=#{new_resource.devicePath}&productionState=#{new_resource.productionValue}&loadDevice:method=1"
        full_uri = URI(base_uri + post_uri)

	Chef::Log.info("POST URI: " + base_uri + post_uri)

        req = Net::HTTP::Post.new(base_uri + post_uri)
        req.basic_auth "#{new_resource.username}", "#{new_resource.password}"

        res = Net::HTTP.start(full_uri.hostname, full_uri.port).request(req)
        output = res.body

	Chef::Log.info("HTTP return code: " + res.code)

	if output.include? "Device #{new_resource.hostname} loaded!"
	  Chef::Log.info("Zenoss registration successful. It is located in #{new_resource.devicePath}")
	  node.set['zenoss-client']['registered'] = true
	else
	  Chef::Log.warn("HTTP Status code: " + res.code)
	  Chef::Log.warn(output)
	  raise "Zenoss registration failed!"
	end
    new_resource.updated_by_last_action(true)
  end
end
