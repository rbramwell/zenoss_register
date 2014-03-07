# zenoss_register LWRP
Registers a client with a Zenoss Core 4 monitoring server. This will register both Linux and Windows systems as it uses the ruby built-in with chef-client to perform a POST call back to the server.

# Requirements

Tested with Zenoss Core 4.

# Usage
Configure a client to register with Zenoss Core 4

````
zenoss_register node['hostname'] do
  username 'admin'
  password 'admin'
  baseuri 'http://zenoss.example.com:8080'
  productionValue 1000
  devicePath '/Server/Windows'
end
```` 
````
name 'zenoss_register'
description 'Add a client to a Zenoss Core 4 server'
default_attributes(
 'zenoss_register' => { 
  'username'          => 'admin',
  'password'          => 'password',
  'baseuri'           => 'http://zen.example.com:8080',
  'productionValue'   => 1000,
  'devicePath'        => '/Server',
  'registered'        => nil
 }
)
````

# Attributes
The following are attributes that can be overridden in the `ntp` namespace
* `['zenoss_register']['username']`
  - String
  - Default 'admin'
  - Username on Zenoss which can create new objects
* `['zenoss_register']['password']`
  - String
  - Default 'password'
  - Password for account who can create new objects
* `['zenoss_register']['baseuri']`
  - String
  - Default 'http://zen.example.com:8080'
  - Base URL of the Zenoss server including the port. Do not provide a trailing slash
* `['zenoss_register']['productionValue']`
  - String
  - Default 1000 or the node's environment variable
  - Production values based on Zenoss Core 4
* `['zenoss_register']['devicePath']`
  - String
  - Default '/Server'
  - The location the object should exist within Zenoss. Defaults to /Server/Linux or /Server/Windows based upon platform
* `['zenoss_register']['registered']`
  - Boolean
  - Default null
  - Set to true once the server has been registered to prevent it from being added during every chef-client run

# Resources
* [Automatically adding and editing devices in Zenoss Core 4 using the API](http://blog.remibergsma.com/2013/04/26/automatically-adding-and-editing-devices-in-zenoss-core-4-using-the-api/)
* [Zenoss Core 4 JSON and API Documentation](http://community.zenoss.org/community/documentation/official_documentation/api)

# Author

Author:: Patrick Moore (<moore267@marshall.edu>), Eric G. Wolfe (<wolfe21@marshall.edu>)
Copyright:: 2014
