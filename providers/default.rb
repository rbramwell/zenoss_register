# 
# Cookbook Name:: zenoss-client
# Provider:: default
#
#  Copyright (C) 2014 Patrick Moore <moore267@marshall.edu>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


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
	  node.set_unless['zenoss-client']['registered'] = true
	else
	  Chef::Log.warn("HTTP Status code: " + res.code)
	  Chef::Log.warn(output)
	  raise "Zenoss registration failed!"
	end
    new_resource.updated_by_last_action(true)
  end
end
