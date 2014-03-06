node.default_attrs['zenoss-client']['registered'] = false
node.automatic_attrs['zenoss-client'].delete('registered') rescue nil
node.normal_attrs['zenoss-client'].delete('registered') rescue nil
node.override_attrs['zenoss-client'].delete('registered') rescue nil
Chef::Log.warn("Value is #{node['zenoss-client']['registered']}")
