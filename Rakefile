#!/usr/bin/env rake

# chefspec task against spec/*_spec.rb
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:chefspec)

# rubocop rake task
desc "Ruby style guide linter"
task :rubocop do
  sh "rubocop"
end

# foodcritic task
desc "Runs foodcritic linter"
task :foodcritic do
  if Gem::Version.new("1.9.2") <= Gem::Version.new(RUBY_VERSION.dup)
    sh "foodcritic --epic-fail any ."
  else
    puts "WARN: foodcritic run is skipped as Ruby #{RUBY_VERSION} is < 1.9.2."
  end
end

# rubocop jenkins rake task
desc 'Ruby style guide - checkformat output'
task :rubocop_checkformat do
  sh 'rubocop --require rubocop/formatter/checkstyle_formatter --format Rubocop::Formatter::CheckstyleFormatter > checkstyle.xml'
end
   

task :default => [ 'chefspec', 'foodcritic', 'rubocop' ]

task :jenkins => [ 'chefspec', 'foodcritic', 'rubocop_checkformat' ]

begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new
rescue LoadError
  puts ">>>>> Kitchen gem not loaded, omitting tasks" unless ENV['CI']
end
