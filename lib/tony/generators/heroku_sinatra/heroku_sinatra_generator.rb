Tony::generators << Tony::Generator.new do |options|
  options.name = "heroku & sinatra"
  options.combination = ['heroku', 'sinatra']
  options.description = "Adds the sinatra gem to the heroku .gems file"
  options.files = {
    '.gems' => 'sinatra'
  }
end
