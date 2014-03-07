#
# Cookbook Name:: zenoss-client
# Attributes:: default
#
# Copyright (C) 2014 Patrick Moore <moore267@marshall.edu>
# 
# All rights reserved - Do Not Redistribute
#
default['zenoss-register']['username'] = 'admin'
default['zenoss-register']['password'] = 'zenoss'
default['zenoss-register']['baseuri'] = "http://zen.#{node['domain']}:8080"
