#
# Cookbook Name:: zenoss-client
# Attributes:: default
#
# Copyright (C) 2014 Patrick Moore <moore267@marshall.edu>
# 
# All rights reserved - Do Not Redistribute
#
default['zenoss_client']['username'] = 'admin'
default['zenoss_client']['password'] = 'password'
default['zenoss_client']['baseuri'] = 'http://zen.example.com:8080'

default['zenoss_client']['productionValue'] = 1000
default['zenoss_client']['devicePath'] = '/Server'
