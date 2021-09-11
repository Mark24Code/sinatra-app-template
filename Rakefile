# Help Doc https://ruby.github.io/rake/doc/rakefile_rdoc.html
require_relative './prepare'
require 'tools'

DefaultConfig = Tools::default_config 

Tools::load_mods('tasks')

desc "List all tasks"
task :list do
  exec("bundle exec rake -T")
end

task default: %w[list]
