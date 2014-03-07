zenoss_client node['hostname'] do
  baseuri "http://zen02.marshall.edu:8080/zport/dmd/DeviceLoader"
  productionValue 'production' 
end
