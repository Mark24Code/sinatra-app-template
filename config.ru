require_relative './cores/bootstrap'
Bootstrap.rack

# routers(handy config)
map '/' do
  run RootController 
end
