require 'sinatra/base'
require 'sinatra/contrib'
require 'sinatra/cors'

# Sinatra Doc http://sinatrarb.com/intro.html
class App < Sinatra::Base
  # Help Doc http://sinatrarb.com/contrib/
  register Sinatra::Contrib

  configure do
    # https://github.com/jdesrosiers/sinatra-cors
    require 'sinatra/cors'
    register Sinatra::Cors
    set :allow_origin, '*'
    set :allow_methods, 'GET,POST,PUT,DELETE,HEAD,OPTIONS'
    set :allow_headers, 'content-type,if-modified-since,allow_headers,authorization'

    # http://sinatrarb.com/contrib/custom_logger
    set :logger, Config::LogMan.base
    enable :logging
  end

  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end

  # Dir['./app/models/*.model.rb'].sort.each do |model_file|
  #   require_relative model_file
  # end

  # Dir['./app/routes/*.route.rb'].sort.each do |route_file|
  #   require_relative route_file
  # end
end
