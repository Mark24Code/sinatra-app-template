# Help Doc https://ruby.github.io/rake/doc/rakefile_rdoc.html
require_relative './prepare'


namespace :server do
  desc "Run server"
  task :run do
    # TODO 可以增加配置
    exec("rackup")
  end
end


desc "List all tasks"
task :list do
  exec("bundle exec rake -T")
end

task default: %w[list]
