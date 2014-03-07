# zenoss-client LWRP
Registers a client with a Zenoss Core 4 monitoring server

# Requirements

Tested with Zenoss Core 4.

# Usage
Configure a client to register with Zenoss Core 4

````
zenoss_client node['hostname'] do
  username 'admin'
  password 'admin'
  baseuri 'http://zenoss.example.com:8080'
  productionValue 1000
  devicePath '/Server/Windows'
end
```` 
````
name 'zenoss_client'
description 'Add a client to a Zenoss Core 4 server'
default_attributes(
 'zenoss_client' => { 
  'username'          => 'admin',
  'password'          => 'password',
  'baseuri'           => 'http://zen.example.com:8080',
  'productionValue'   => 1000,
  'devicePath'        => '/Server'
 }
)
````

# Attributes
The following are attributes that can be overridden in the `ntp` namespace

* `['ntp']['servers']`
  - Array of upstream NTP servers. 
  - Default [rackety.udel.edu clock.via.net time-a.nist.gov time-b.nist.gov time.wvu.edu ntp-1.cso.uiuc.edu]
* `['ntp']['peers']`
  - Array of peer NTP servers
  - Default [10.101.7.149 10.101.7.150 10.101.7.151]
* `['ntp']['restrictions']`
  - Array of restrictions to apply
  - Default ['10.0.0.0 mask 255.0.0.0 nomodify notrap' '172.16.0.0 mask 255.255.0.0 nomodify notrap']

# Resources
* [Stratum 1 Time Servers](http://support.ntp.org/bin/view/Servers/StratumOneTimeServers)
* [NTP FAQ](http://www.ntp.org/ntpfaq/NTP-a-faq.htm)
* [NTP Documentation](http://www.ntp.org/documentation.html)

# Author

Author:: Patrick Moore (<moore267@marshall.edu>), Eric G. Wolfe (<wolfe21@marshall.edu>)
Copyright:: 2014
