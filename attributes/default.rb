#
# Cookbook Name:: zenoss_client
# Attributes:: default
#
# Copyright (C) 2014 Patrick Moore <moore267@marshall.edu>
#
# All rights reserved - Do Not Redistribute
#
default['zenoss_register']['username'] = 'admin'
default['zenoss_register']['password'] = 'zenoss'
default['zenoss_register']['baseuri'] = "http://zen.#{node['domain']}:8080"
