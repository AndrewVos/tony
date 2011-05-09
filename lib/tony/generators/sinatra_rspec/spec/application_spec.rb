ENV['RACK_ENV'] = 'test'

require 'application'
require 'rspec'
require 'rack/test'

describe Application do
  include Rack::Test::Methods

  def app
    Application
  end

  context "GET /" do
    it "should not 404" do
      get "/"
      last_response.ok?.should == true
    end
  end
end

