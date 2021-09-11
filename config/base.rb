# Sinatra Doc http://sinatrarb.com/intro.html
require 'sinatra/base'
require 'tools'
require 'json'

class BaseApp < Sinatra::Base
  # Inject config
  @@app_config = Tools::app_config('config/base_config.yml')


  # Sinatra Middlewares
  # Help Doc http://sinatrarb.com/contrib/

  configure do

    # http://sinatrarb.com/contrib/multi_route
    require "sinatra/multi_route"
    register Sinatra::MultiRoute

    # https://github.com/jdesrosiers/sinatra-cors
    require 'sinatra/cors'
    register Sinatra::Cors
    set :allow_origin, '*'
    set :allow_methods, 'GET,POST,PUT,DELETE,HEAD,OPTIONS'
    set :allow_headers, 'content-type,if-modified-since,allow_headers,authorization'

  end

  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end

  configure :production do

  end

  configure :development, :production do

    require 'log/base_loggerger'
    # http://sinatrarb.com/contrib/custom_logger
    require 'sinatra/custom_logger'
    helpers Sinatra::CustomLogger
    set :logger, $LOGGER
  end


end
