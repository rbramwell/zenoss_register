# 
# Cookbook Name:: zenoss-client
# Recipe:: default
#
#  Copyright (C) 2014 Patrick Moore <moore267@marshall.edu>, Eric G. Wolfe <wolfe21@marshall.edu>
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


def prod_state [( pstate='production' )]

  # Hash with name => numeric mappings
  pstate_table = {
    'production' => 1000,
    'prod' => 1000,
    'preprod' => 500,
    'preproduction' => 500,
    'pre-production' => 500,
    'test' => 400,
    'maintenance' => 300,
    'decommissioned' => -1
  }

  # Normalize input to lowercase
  # 
  # if in lookup table, return value
  #
  # if it looks like pre-prod or preprod, return 500
  #
  # if it looks like test, return 400
  #
  # if unknown, return 1000
  if pstate_table.key?(pstate.downcase)
    return pstate_table[pstate.downcase]
  elsif pstate.downcase =~ /pre-?prod/
    return 500
  elsif pstate.downcase =~ /test/
    return 400
  else
    return 1000
  end
end
