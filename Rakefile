require "bundler/gem_tasks"
require "rspec/core/rake_task"
require_relative './config/environment'
require 'sinatra/activerecord/rake'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

ENV["SINATRA_ENV"] ||= "development"

task :console do
  Pry.start
end
