class App < Sinatra::Base
  configure do
    set :root, Pathname.new('.')
    set :app_env, ENV.fetch('APP_ENV'){ 'development' }
    set :bind, ENV.fetch('APP_HOST') { '0.0.0.0' }
    set :port, ENV.fetch('APP_PORT') { 4567 }
    set :secret, ENV.fetch('APP_SECRET') { 'YOU CANNT GUESS ME' }
  end

  # configure :development do
  # end

  # configure :production do
  # end
end
