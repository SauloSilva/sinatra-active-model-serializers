ENV['RACK_ENV'] = 'test'

require 'sinatra'
require 'sinatra/contrib'
require 'app/application'
require 'rspec'
require 'rack/test'
Dir[File.expand_path '../support/**/*.rb',  __FILE__].each { |file| require file }

RSpec.configure do |config|
  config.expect_with :rspec
  include Rack::Test::Methods
  include RequestSupport
  DatabaseCleaner.clean_with :truncation
  DatabaseCleaner.strategy = :transaction

  before :all do
    DatabaseCleaner.start
  end

  after :all do
    DatabaseCleaner.clean
  end

  def app
    App::Base
  end
end
