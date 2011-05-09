Tony::generators << Tony::Generator.new do |options|
  options.name = "sinatra"
  options.description = "Generates a Sinatra application"
  options.files = {}
  [
    'config.ru',
    'lib/application.rb',
    'lib/configuration.rb',
    'public/scripts/main.js',
    'public/styles/main.css',
    'views/index.erb',
    'views/layout.erb'
  ].each do |path|
    options.files[path] = File.read(File.join(File.dirname(__FILE__), path))
  end
  options.gems = ['sinatra']
end
