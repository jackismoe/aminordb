ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

db_config = YAML.load_file('config/database.yml')
ActiveRecord::Base.establish_connection(db_config['production'])

require './app/controllers/application_controller'
require_all 'app'

