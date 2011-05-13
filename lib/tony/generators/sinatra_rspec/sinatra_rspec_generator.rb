Tony::generators << Tony::Generator.new do |options|
  options.name = "sinatra & rspec"
  options.description = "sinatra and rspec"
  options.combination = ["sinatra", "rspec"]
  options.files = {
    'spec/application_spec.rb' => File.read(File.join(File.dirname(__FILE__), 'spec', 'application_spec.rb'))
  }
end
