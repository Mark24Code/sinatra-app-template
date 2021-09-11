require 'tools'

namespace :server do
  desc "Run server"
  task :run do
    app_env = $APP_ENV
    default_config = Tools::default_config
    server_host = default_config['bind']
    server_port = default_config['port']
    server_max_threads = default_config['max_threads']

    exec("APP_ENV=#{app_env} \
      RACK_ENV=#{app_env} \
      bundle exec rackup \
      -o #{server_host} \
      -p #{server_port} \
      -O 0:#{server_max_threads}")
  end
end