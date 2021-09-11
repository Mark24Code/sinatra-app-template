# Sinatra Doc http://sinatrarb.com/intro.html
require 'sinatra/base'
require 'tools'
require 'json'

module App
  class Base < Sinatra::Base
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

      # http://sinatrarb.com/contrib/custom_logger
      require 'sinatra/custom_logger'
      require 'logger'
      helpers Sinatra::CustomLogger
      @@logger = Logger.new(File.open(File.expand_path(File.join($PROJECT_DIR,"log","#{$APP_ENV}.log")),'a'))
      @@logger.level = Logger::DEBUG if development?
      set :logger, @@logger
    end


  end
end

