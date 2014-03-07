actions :register
default_action :register

attribute :hostname,            kind_of: String, name_attribute: true
attribute :username,            kind_of: String, default: 'admin'
attribute :password,            kind_of: String, default: 'zenoss'
attribute :baseuri,             kind_of: String
case node['platform']
when 'windows'
  attribute :devicePath,        kind_of: String, default: '/Server/Windows'
when 'linux'
  attribute :devicePath,        kind_of: String, default: '/Server/Linux'
else
  attribute :devicePath,        kind_of: String, default: '/Server'
end
attribute :productionValue,     kind_of: Integer, default: prod_state[node['chef_environment']]
