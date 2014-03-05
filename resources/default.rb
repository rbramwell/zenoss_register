actions :register
default_action :register

attribute :hostname,            :kind_of => String,  :name_attribute => true
attribute :username,            :kind_of => String
attribute :password,            :kind_of => String
attribute :baseuri,             :kind_of => String
attribute :devicePath,          :kind_of => String
attribute :productionValue,     :kind_of => Integer, :default => 1000

