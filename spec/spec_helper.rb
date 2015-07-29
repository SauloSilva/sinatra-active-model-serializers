ENV['RACK_ENV'] = 'test'

require 'sinatra'
require 'sinatra/contrib'
require 'app/application'
require 'rspec'
require 'rack/test'
require 'coveralls'

Coveralls.wear!
Dir[File.expand_path '../support/**/*.rb',  __FILE__].each { |file| require file }

RSpec.configure do |config|
  config.expect_with :rspec
  include Rack::Test::Methods
  include RequestSupport

  def app
    App::Base
  end
end
