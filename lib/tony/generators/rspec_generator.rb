Tony::generators << Tony::Generator.new do |options|
  options.name = "rspec"
  options.description = "Generates rspec rake tasks, spec directories and a spec_helper"
  options.files = {
    'Rakefile' => <<-FILE
require 'rspec/core/rake_task'

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = "./spec/**/*_spec.rb" # don't need this, it's default.
end
    FILE
  }
end
