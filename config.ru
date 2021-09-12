# TODO
# init
require_relative './prepare'
# config
require 'tools'
# database
require 'db/base_db'

# rack middleware

# mount app
require 'apps/root'

# router 
map '/' do
  run Root 
end
