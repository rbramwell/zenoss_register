

actions :register
default_action :register

attribute :username,            :kind_of => String
attribute :password,            :kind_of => String
attribute :baseURL,             :kind_of => String
attribute :devicePath,          :kind_of => String
attribute :productionState,     :kind_of => Integer, :default => 1000

