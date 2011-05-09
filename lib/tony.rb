$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'tony'))
require 'tony'
require 'generator'

Dir.glob(File.join(File.dirname(__FILE__), '**/*_generator.rb')).each do |generator|
  require generator
end
