require_relative '../configs/core/base'

class AppException < Exception
end

class App < Sinatra::Base
  # config ./config/

  # middles
  Dir['./app/middlewares/*.middleware.rb'].each do |mod|
    require mod
  end
  use Middleware::Sample

  # custom Exception
  error AppException do |message|
  end

  # custom 404
  not_found do
  end

  # models
  Dir['./app/routes/*.model.rb'].each do |mod|
    require mod
  end

  # routes
  Dir['./app/routes/*.route.rb'].each do |mod|
    require mod
  end

  # health check /api/v1/ping
  namespace '/api/v1' do
    get '/ping' do
      "ping success"
    end
  end
end
