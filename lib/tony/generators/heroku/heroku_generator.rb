Tony::generators << Tony::Generator.new do |options|
  options.name = "heroku"
  options.description = "Adds the heroku .gems file"
  options.files = {
    '.gems' => ''
  }
end
