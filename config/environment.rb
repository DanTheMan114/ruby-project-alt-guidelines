require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'

ActiveRecord::Base.logger = nil

#require_all 'app'

#require_relative 'api_key'
require_relative '../bin/api_query'