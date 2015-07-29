require 'rubygems'
require 'bundler'
Bundler.require(:defaut, :test)

require 'sinatra/activerecord'
require './lib/sinatra-active-model-serializers/'
Dir['./spec/app/models/**/*.rb'].flatten.sort.each { |file| require file}

module App
  class Base < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    set :serializers_path, './spec/app/serializers'

    configure :test do
      ActiveRecord::Base.logger = nil
    end

    before do
      @test ||= Test.new(foo: 'foo')
    end

    get '/with-root/' do
      json @test, root: true
    end

    get '/without-root/' do
      json @test, root: false
    end

    get '/with-specific-serializer/' do
      json @test, root: false, serializer: FooSerializer
    end

    get '/with-each-serializer/' do
      tests = [@test, @test]
      json tests, root: 'units', each_serializer: UnitarySerializer
    end
  end
end

App::Base.run