require 'rubygems/tasks'
Gem::Tasks.new

require "sinatra/activerecord/rake"

namespace :db do
  task :load_config do
    require "./spec/app/application"
  end
end