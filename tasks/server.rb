require 'tools'

namespace :server do
  desc "Run server"
  task :run do
    app_env = $APP_ENV
    server_host = DefaultConfig['bind']
    server_port = DefaultConfig['port']
    server_max_threads = DefaultConfig['max_threads']
    exec("APP_ENV=#{app_env} RACK_ENV=#{app_env} bundle exec rackup -o #{server_host} -p #{server_port} -O 0:#{server_max_threads}")
  end
end