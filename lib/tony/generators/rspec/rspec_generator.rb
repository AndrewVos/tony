Tony::generators << Tony::Generator.new do |options|
  options.name = "rspec"
  options.description = "Generates rspec rake tasks, spec directories and a spec_helper"
  options.files = {
    'Rakefile' => File.read(File.join(File.dirname(__FILE__), 'Rakefile'))
  }
end
