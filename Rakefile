begin
  ENV['BUNDLE_GEMFILE'] = File.dirname(__FILE__) + '/Gemfile'
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

# require 'rspec'
require 'rspec/core/rake_task'

namespace :spec do
  
  desc "cli_shopping models"
  RSpec::Core::RakeTask.new(:models) do |task|
    base_path = File.expand_path(File.dirname(__FILE__))
    task.pattern = base_path + '/spec/models/**/*_spec.rb'
    puts task.pattern
  end
end

task :spec => ['spec:models']

task :default => :spec