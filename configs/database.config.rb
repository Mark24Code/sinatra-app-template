class App < Sinatra::Base
  configure do
    set :database_host, ENV.fetch('DATABASE_HOST')
    set :database_port, ENV.fetch('DATABASE_PORT')
    set :database_name, ENV.fetch('DATABASE_NAME')
    set :database_user, ENV.fetch('DATABASE_USER')
    set :database_password, ENV.fetch('DATABASE_PASSWORD')
  end

  # configure :development do
  # end

  # configure :production do
  # end
end
