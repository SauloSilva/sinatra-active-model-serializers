# -*- encoding: utf-8 -*-

# Run `rake sinatra-contrib.gemspec` to update the gemspec.
require File.expand_path('../lib/sinatra_active_model_serializers/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'sinatra-active-model-serializers'
  s.version     = SinatraActiveModelSerializers::VERSION
  s.description = 'Adapter from Active Model Serializers, to work in Sinatra from a more practical way with models'
  s.homepage    = 'https://github.com/SauloSilva/sinatra-active-model-serializers'
  s.summary     = 'Adapter from Active Model Serializers'

  s.license = 'MIT'

  # generated from git shortlog -sn
  s.authors = ['saulosantiago']

  # generated from git shortlog -sne
  s.email = ['saulodasilvasantiago@gmail.com']

  # generated from git ls-files
  s.files = [
    '.gitignore',
    'Gemfile',
    'LICENSE',
    'README.md',
    'Rakefile',
    'db/migrate/00_create_tests.rb',
    'db/schema.rb',
    'lib/sinatra_active_model_serializers.rb',
    'lib/sinatra_active_model_serializers/json.rb',
    'lib/sinatra_active_model_serializers/version.rb',
    'sinatra-active-model-serializers.gemspec',
    'spec/app/application.rb',
    'spec/app/models/test.rb',
    'spec/app/serializers/test_serializer.rb',
    'spec/json_spec.rb',
    'spec/schemas/test_with_root.json',
    'spec/schemas/test_without_root.json',
    'spec/spec_helper.rb',
    'spec/support/request_support.rb'
  ]

  s.add_runtime_dependency 'active_model_serializers', '0.9.3'
end
