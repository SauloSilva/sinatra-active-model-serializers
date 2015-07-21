require 'rubygems'
require 'bundler'
Bundler.require(:defaut, :test)

require './lib/sinatra-active-model-serializers/'
Dir['./spec/app/models/**/*.rb'].flatten.sort.each { |file| require file}

module App
  class Base < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    set :serializers_path, './spec/app/serializers'

    configure :test do
      ActiveRecord::Base.logger = nil
    end

    set :database, {
      adapter: 'sqlite3',
      database: 'db/sinatra_active_model_serializers.sqlite3'
    }

    get '/with-root/' do
      json Test.create(foo: 'bar'), root: true
    end

    get '/without-root/' do
      json Test.create(foo: 'bar'), root: false
    end

    get '/with-specific-serializer/' do
      json Test.create(foo: 'bar'), root: false, serializer: FooSerializer
    end

    get '/with-each-serializer/' do
      Test.create(foo: 'bar1')
      Test.create(foo: 'bar2')
      json Test.all, root: 'units', each_serializer: UnitarySerializer
    end
  end
end

App::Base.run