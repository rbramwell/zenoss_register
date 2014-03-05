action :register do
#  not_if exists?
    Chef::Log.warn("Registering node with zen server #{new_resource}")
#    ruby_block "register" do
#      block do
        require 'net/http'
        base_uri = "#{new_resource.baseuri}"
        post_uri = "?deviceName=#{new_resource.hostname}&devicePath=#{new_resource.devicePath}&productionState=#{new_resource.productionValue}&loadDevice:method=1"
        full_uri = URI(base_uri + post_uri)

	Chef::Log.warn(base_uri + post_uri)

        #req = Net::HTTP::Post.new(full_uri.path + "?" + full_uri.query)
        #req = Net::HTTP::Post.new(full_uri.to_s)
        req = Net::HTTP::Post.new(base_uri + post_uri)
        req.basic_auth "#{new_resource.username}", "#{new_resource.password}"

        res = Net::HTTP.start(full_uri.hostname, full_uri.port).request(req)
        puts res.body
	Chef::Log.warn(res.code)
#      end  
#    end
#    new_resource.updated_by_last_action(true)
end

def exists?
  ::File.exists?("#{Chef::Config[:file_cache_path]}/zenrun.txt")
end
