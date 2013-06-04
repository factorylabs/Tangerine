require "bundler/gem_tasks"
require 'rspec/core/rake_task'

# Load all Tangerine-specific rake tasks
Dir["#{File.dirname(__FILE__)}/spec/lib/tasks/**/*.rb"].each {|f| load(f) }

RSpec::Core::RakeTask.new(:spec)

task default: :spec
