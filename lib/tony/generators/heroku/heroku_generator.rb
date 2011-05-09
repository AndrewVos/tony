Tony::generators << Tony::Generator.new do |options|
  options.name = "heroku"
  options.description = "Generates a heroku .gems file"
  gems = Tony.used_generators.map { |g|
    g.gems ||= []
  }.flatten
  options.files = {
    '.gems' => gems
  }
end
