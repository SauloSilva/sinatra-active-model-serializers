require 'rubygems'
require 'bundler'
Bundler.require(:defaut, :test)

require './lib/sinatra-active-model-serializers/'
Dir['./spec/app/models/**/*.rb'].flatten.sort.each { |file| require file}

module App
  class Base < Sinatra::Base
    set :serializers_path, './spec/app/serializers'

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