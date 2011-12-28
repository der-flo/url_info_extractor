require "bundler/gem_tasks"
require 'rspec/core/rake_task'

desc "Run specs with SimpleCov"
RSpec::Core::RakeTask.new('coverage') do |t|
  ENV['COVERAGE'] = 'true'
end

