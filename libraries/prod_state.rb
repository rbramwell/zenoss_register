# Hash lookup for various likely chef_environment strings
def prod_state_lookup(pstate)
  # Hash with name => numeric mappings
  pstate_table = { 'production' => 1000, 'prod' => 1000, '_default' => 1000,
                   'preprod' => 500, 'preproduction' => 500,
                   'pre-production' => 500, 'test' => 400, 'maintenance' => 300,
                   'decommissioned' => -1
  }
  if pstate_table.key?(pstate.downcase)
    return pstate_table[pstate.downcase]
  else
    return 0
  end
end

# Edge cases where something might be named fooprod, footest.
def prod_state_edge_case(pstate)
  if pstate.downcase =~ /pre-?prod/
    return 500
  elsif pstate.downcase =~ /test/
    return 400
  else
    return 1000
  end
end

# Try table and edge lookup
def prod_state(pstate)
  if prod_state_lookup(pstate) != 0
    return prod_state_lookup(pstate)
  else
    return prod_state_edge_case(pstate)
  end
end
