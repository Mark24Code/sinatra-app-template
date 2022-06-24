require 'sinatra/base'
require 'sinatra/contrib'

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
    set :logger, Boot::LogMan.base
  end

  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end

  # register UsersController
  # register TodoListsController

  class << self
    def define_routes(&block)
      class_eval(&block) if block_given?
    end

    def autoload_models
      Dir['./**/*.model.rb'].sort.each do |model_file|
        require model_file
      end
    end

    def autoload_routes
      Dir['./**/*.route.rb'].sort.each do |route_file|
        require route_file
      end
    end
  end
end

App.autoload_models
App.autoload_routes
