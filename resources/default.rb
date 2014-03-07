#
# Cookbook Name:: zenoss_register
# Resource:: default
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

actions :register
default_action :register

attribute :deviceName,          kind_of: String, name_attribute: true
attribute :username,            kind_of: String, default: 'admin'
attribute :password,            kind_of: String, default: 'zenoss'
attribute :baseuri,             kind_of: String, default: "http://zen.#{node['domain']}:8080"
case node['kernel']['os']
when /(winnt|windows)/i
  attribute :devicePath,        kind_of: String, default: '/Server/Windows'
when /linux/i
  attribute :devicePath,        kind_of: String, default: '/Server/Linux'
else
  attribute :devicePath,        kind_of: String, default: '/Server'
end
attribute :productionState,     kind_of: Integer, default: prod_state(node.chef_environment)
