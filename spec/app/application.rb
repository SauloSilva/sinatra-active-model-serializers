require 'rubygems'
require 'bundler'
Bundler.require(:test)

Dir['./lib/sinatra_active_model_serializers/**/*.rb'].flatten.sort.each { |file| require file}
Dir['./spec/app/models/**/*.rb'].flatten.sort.each { |file| require file}
Dir['./spec/app/serializers/**/*.rb'].flatten.sort.each { |file| require file }

module App
  class Base < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    configure :test do
      ActiveRecord::Base.logger = nil
    end

    set :database, {
      adapter: 'sqlite3',
      database: 'sinatra_active_model_serializers.sqlite3'
    }

    get '/with-root/' do
      json Test.create(foo: 'bar'), { root: true }
    end

    get '/without-root/' do
      json Test.create(foo: 'bar'), { root: false }
    end
  end
end

App::Base.run