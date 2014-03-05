zenoss_client node['hostname'] do
  username 'admin'
  password 'zenoss'
  baseuri "http://zen02.marshall.edu:8080/zport/dmd/DeviceLoader"
  if platform?("windows")
    devicePath "/Server/Windows"
  else
    devicePath "/Server/Linux"
  end
  productionValue 500
end

