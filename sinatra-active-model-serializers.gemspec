# -*- encoding: utf-8 -*-

# Run `rake sinatra-contrib.gemspec` to update the gemspec.
require File.expand_path('../lib/sinatra_active_model_serializers/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'sinatra-active-model-serializers'
  s.version     = Sinatra::ActiveModelSerializers::VERSION
  s.description = 'Collection of useful Sinatra extensions'
  s.homepage    = 'http://github.com/saulosantiago/sinatra-active-model-serializers'
  s.summary     = s.description

  # generated from git shortlog -sn
  s.authors = ['saulo santiago']

  # generated from git shortlog -sne
  s.email = ['saulodasilvasantiago@gmail.com']

  # generated from git ls-files
  s.files = [
    'LICENSE',
    'README.md',
    'Rakefile'
  ]

  s.add_dependency 'sinatra',                   '~> 1.4.5'
  s.add_dependency 'sinatra-contrib',           ' ~> 1.4.2'
  s.add_dependency 'active_model_serializers',  '0.9.3'
end
