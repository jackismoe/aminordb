ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
    {:adapter => 'postgresql',
     :database => 'aminordb',
     :host => 'aminordb',
     :port => '5432',
     :username => 'postgres',
     :password => 'postgres'})

require './app/controllers/application_controller'
require_all 'app'

