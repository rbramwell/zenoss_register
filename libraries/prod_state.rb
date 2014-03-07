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
