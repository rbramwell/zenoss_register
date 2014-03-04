#
# Cookbook Name:: zenoss-client
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#
if node['platform'] == 'windows'  

  powershell_script "zenossRegister" do
    code <<-EOH
     $user = "#{node[:zenoss_client][:admin_user]}"
     $pass = "#{node[:zenoss_client][:admin_pass]}"

     $baseUri = "#{node[:zenoss_client][:zen_server]}"

     $uri = New-Object System.Uri($baseUri + "?deviceName=#{node[:fqdn]}&devicePath=#{node[:zenoss_client][:devicePath]}&productionState=#{node[:zenoss_client][:productionState]}&loadDevice:method=1")

     $encoded = [System.Convert]::TOBase64String([System.Text.Encoding]::UTF8.GetBytes($user+":"+$pass))
     $header = @{Authorization = "Basic "+$encoded}
     $r = Invoke-WebRequest -Uri $uri.AbsoluteUri -Headers $header
     $r.Content
    EOH

    notifies :create, "file[#{Chef::Config[:file_cache_path]}/zenrun.txt]", :immediately
    not_if do
      File.exists?("#{Chef::Config[:file_cache_path]}/zenrun.txt")
    end
  end
else
  package "curl"
  execute "linuxZenossRegister" do
    command <<-EOF
	  curl -u #{node['zenoss_client']['admin_user']}:#{node['zenoss_client']['admin_pass']} "#{node['zenoss_client']['zen_server']}?deviceName=#{node['fqdn']}&devicePath=#{node['zenoss_client']['devicePath']}&productionState=#{node['zenoss-client']['productionState']}&loadDevice:method=1"
	EOF
	notifies :create, "file[#{Chef::Config[:file_cache_path]}/zenrun.txt]", :immediately
	not_if do
	  File.exists?("#{Chef::Config[:file_cache_path]}/zenrun.txt")
	 end
  end
end

file "#{Chef::Config[:file_cache_path]}/zenrun.txt" do
    action :nothing
end
