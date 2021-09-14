require_relative './cores/bootstrap'
Bootstrap.rack

require 'controllers/root_controller'
# routers(handy config)
map '/' do
  run RootController 
end
