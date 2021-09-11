require_relative './prepare'

# TODO
# init
# config
# database
# rack middleware

# mount app
require 'apps/root'

# router 
map '/' do
  run Root 
end
