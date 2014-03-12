zenoss_register LWRP
====================

[![Build Status](https://secure.travis-ci.org/themoore/zenoss_register.png?branch=master)](http://travis-ci.org/themoore/zenoss_register)

Registers a client with a Zenoss Core 4 monitoring server. This will register both Linux and Windows systems as it uses the ruby built-in with chef-client to perform a POST call back to the server.

Requirements
------------

Tested with Zenoss Core 4.  Depends on `net/http`, which should be provided by Chef's Ruby.

Resources/Providers
-------------------

### zenoss_register

This resource allows one to register a client on a Zenoss via LWRP.
Parameters, devicePath and productionState are derived from, Ohai `kernel.os`
and `chef_environment` method respectively.

The included `prod_state` library will return numeric values to somewhat
intelligently calculate the Zenoss productionState value.

Generally `prod_state` outputs the following for `productionState` given environment inputs.

    production/prod => 1000,
    pre-prod/preprod => 500,
    test => 400,
    maintenance => 300,
    decommissioned => -1,
    other => 1000

`devicePath` will be set to /Server/Windows, /Server/Linux, or /Server depending on `kernel.os`

#### Examples

Configure a client to register with Zenoss using LWRP.  See default recipe
for an example.

```
zenoss_register node['hostname'] do
  username 'admin'
  password 'admin'
  baseuri 'http://zenoss.example.com:8080'
  devicePath '/Server/Linux'
  productionState prod_state['production']
end
```

Configure a client to register with Zenoss via role.

```
name 'zenoss_register_production'
description 'Add a client to a Zenoss Core 4 server'
default_attributes(
  'zenoss_register' => { 
    'username'          => 'admin',
    'password'          => 'password',
    'baseuri'           => 'http://zen.example.com:8080',
  }
)
run_list "recipe[zenoss_register::default]"
```

#### Actions

* `:register` is the only action supported at this time.

#### Parameters

* `deviceName` - Hostname of device to be monitored, defaults to name of resource.

* `username` - an API admin with permission to add devices to Zenoss, default `admin`.

* `password` - an API password with permission to add devices to Zenoss, default `zenoss`.

* `baseuri` - the base URI/URL for your Zenoss instance, default `http://zen.#{node['domain']}:8080`

* `devicePath` - the device container where the monitored client will be added, default platform-specific.

* `productionState` - the numerical Zenoss state, based on the `chef_environment` method.  Default, derived via `prod_state(chef.environment)`

Attributes
----------

The following are attributes that can be overridden in the `zenoss_register` namespace

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
  - Default "http://zen.#{node['domain']}:8080"
  - Base URL of the Zenoss server including the port. Do not provide a trailing slash

* `['zenoss_register']['devicePath']`
  - String
  - Default platform specific

* `['zenoss_register']['productionState']`
  - Integer
  - Default is derived from chef environment, otherwise 1000
  - Sets production state within Zenoss

Attribute set by provider, probably should not mess with this:

* `['zenoss_register']['registered']`
  - Bool
  - Default false
  - Set in provider to true.

References
----------

* [Automatically adding and editing devices in Zenoss Core 4 using the API](http://blog.remibergsma.com/2013/04/26/automatically-adding-and-editing-devices-in-zenoss-core-4-using-the-api/)
* [Zenoss Core 4 JSON and API Documentation](http://community.zenoss.org/community/documentation/official_documentation/api)

License and Authors
-------------------

Author:: Patrick Moore (moore267@marshall.edu)

Eric G. Wolfe (wolfe21@marshall.edu)

Copyright:: 2014

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License
