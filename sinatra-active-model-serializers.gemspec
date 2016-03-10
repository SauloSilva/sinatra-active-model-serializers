# -*- encoding: utf-8 -*-

# Run `rake sinatra-contrib.gemspec` to update the gemspec.
require File.expand_path('../lib/sinatra-active-model-serializers/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'sinatra-active-model-serializers'
  s.version     = SinatraActiveModelSerializers::VERSION
  s.description = 'Adapter from Active Model Serializers, to work in Sinatra from a more practical way with models'
  s.homepage    = 'https://github.com/SauloSilva/sinatra-active-model-serializers'
  s.summary     = 'Adapter from Active Model Serializers'

  s.license = 'MIT'

  # generated from git shortlog -sn
  s.authors = ['Saulo Santiago', 'Adriano Tadao']

  # generated from git shortlog -sne
  s.email = ['saulodasilvasantiago@gmail.com', 'drianotadao@gmail.com']

  # generated from git ls-files
  s.files = [
    '.coveralls.yml',
    '.gitignore',
    '.hound.yml',
    '.rubocop.yml',
    'CHANGELOG.md',
    'Gemfile',
    'Gemfile.lock',
    'LICENSE',
    'README.md',
    'Rakefile',
    'lib/sinatra-active-model-serializers.rb',
    'lib/sinatra-active-model-serializers/json.rb',
    'lib/sinatra-active-model-serializers/version.rb',
    'sinatra-active-model-serializers.gemspec',
    'spec/app/application.rb',
    'spec/app/models/test.rb',
    'spec/app/serializers/foo_serializer.rb',
    'spec/app/serializers/test_serializer.rb',
    'spec/app/serializers/unitary_serializer.rb',
    'spec/json_spec.rb',
    'spec/schemas/test_with_each_serializer.json',
    'spec/schemas/test_with_root.json',
    'spec/schemas/test_with_specific_serializer.json',
    'spec/schemas/test_without_root.json',
    'spec/spec_helper.rb',
    'spec/support/request_support.rb'
  ]

  s.add_runtime_dependency 'sinatra', '~> 1.4'
  s.add_runtime_dependency 'sinatra-contrib', '>= 1.4.1'
  s.add_runtime_dependency 'activemodel', '~> 4.2.0'
  s.add_runtime_dependency 'active_model_serializers', '~> 0.9.0'
end