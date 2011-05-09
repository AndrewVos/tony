require 'rubygems'
require 'sinatra/base'
require File.join(File.dirname(__FILE__), 'configuration.rb')

class Application < Sinatra::Base
  get '/?' do
    erb :index
  end
end
