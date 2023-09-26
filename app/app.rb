require_relative '../config/core/base'

class AppException < Exception
end

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

  # middlewares
  Dir['./app/middlewares/*.middleware.rb'].each do |route_file|
    require route_file
  end

  use Middleware::Sample


  # TODO lazy load
  # when use it then load it
  Dir['./app/routes/*.model.rb'].each do |route_file|
    require route_file
  end

  Dir['./app/routes/*.route.rb'].each do |route_file|
    require route_file
  end

  # custom Exception
  error AppException do |message|
  end

  # custom 404
  not_found do
  end

  # namespace
  namespace '/api/v1' do
    get '/ping' do
      "ping success"
    end
  end
end
