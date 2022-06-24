require_relative './base/base_setting'

module Config
  module Setting
    Development.configure do
      set :app_env, ENV.fetch('APP_ENV'){ 'development' }
      set :bind, ENV.fetch('APP_HOST') { '0.0.0.0' }
      set :port, ENV.fetch('APP_PORT') { 4567 }
      set :secret, ENV.fetch('APP_SECRET') { 'YOU CANNT GUESS ME' }
      set :max_threads, ENV.fetch('APP_MAX_THREADS') { 5 }
      set :database_url, ENV['APP_DATABASE_URL']
    end

    Test.configure do 
      # set :database_url, ENV['APP_DATABASE_URL']
    end

    Production.configure do 
      # set :database_url, ENV['APP_DATABASE_URL']
    end
  end
end