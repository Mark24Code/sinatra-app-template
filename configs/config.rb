Config::Default.configure do
  set :app_env, ENV.fetch('APP_ENV'){ 'development' }
  set :bind, ENV.fetch('HOST') { '0.0.0.0' }
  set :port, ENV.fetch('PORT') { 3000 }
  set :secrets, ENV.fetch('SECRETS') { 'YOU CANNT GUESS ME' }
  set :max_threads, ENV.fetch('MAX_THREADS') { 5 }

  set :database_url, ENV['DATABASE_URL']
end

Config::Development.configure do 
  # set :database_url, ENV['DATABASE_URL']
end

Config::Test.configure do 
  # set :database_url, ENV['DATABASE_URL']
end

Config::Production.configure do 
  # set :database_url, ENV['DATABASE_URL']
end


