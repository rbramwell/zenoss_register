#
# Cookbook Name:: zenoss-client
# Attributes:: default
#
# Copyright (C) 2014 Patrick Moore <moore267@marshall.edu>
# 
# All rights reserved - Do Not Redistribute
#
default['zenoss_client']['admin_user'] = 'admin'
default['zenoss_client']['admin_pass'] = 'zenoss'
default['zenoss_client']['zen_server'] = 'http://zen02.marshall.edu:8080/zport/dmd/DeviceLoader'
default['zenoss-client']['registered'] = false
default['zenoss_client']['devicePath'] = '/Server/NEW'
default['zenoss_client']['deviceLocation'] = '/Huntington/Drink Library'
