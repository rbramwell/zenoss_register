#
# Cookbook Name:: zenoss_register
# Recipe:: default
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
default['zenoss_register']['username'] = 'admin'
default['zenoss_register']['password'] = 'zenoss'
default['zenoss_register']['baseuri'] = "http://zen.#{node['domain']}:8080"
default['zenoss_register']['registered'] = false
