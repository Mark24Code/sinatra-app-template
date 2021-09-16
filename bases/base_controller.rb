# Sinatra Doc http://sinatrarb.com/intro.html
require 'sinatra/base'
require 'json'

class BaseController < Sinatra::Base
  # Inject config

  # Rewrite Views dir
  settings.views = File.expand_path(File.join($PROJECT_DIR, 'views'))

  # Sinatra Middlewares
  # Help Doc http://sinatrarb.com/contrib/

  configure do
    # http://sinatrarb.com/contrib/json
    require "sinatra/json"

    # http://sinatrarb.com/contrib/multi_route
    require "sinatra/multi_route"
    register Sinatra::MultiRoute

    # https://github.com/jdesrosiers/sinatra-cors
    require 'sinatra/cors'
    register Sinatra::Cors
    set :allow_origin, '*'
    set :allow_methods, 'GET,POST,PUT,DELETE,HEAD,OPTIONS'
    set :allow_headers, 'content-type,if-modified-since,allow_headers,authorization'

    # http://sinatrarb.com/contrib/content_for
    require "sinatra/content_for"
    helpers Sinatra::ContentFor
  end

  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end

  configure :production do

  end

  configure :development, :production do

    # http://sinatrarb.com/contrib/custom_logger
    require 'sinatra/custom_logger'
    helpers Sinatra::CustomLogger
    set :logger, Loggers.base
  end


end
