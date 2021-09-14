namespace :server do
  desc "Run server"
  task :run do
    config = Config.current
    app_env = config.app_env
    server_host = config.bind
    server_port = config.port
    server_max_threads = config.max_threads

    exec("APP_ENV=#{app_env} \
      RACK_ENV=#{app_env} \
      bundle exec rackup \
      -o #{server_host} \
      -p #{server_port} \
      -O 0:#{server_max_threads}")
  end
end