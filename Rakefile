# Help Doc https://ruby.github.io/rake/doc/rakefile_rdoc.html
require_relative './prepare'
require 'tools'
require 'log/base_logger'


Tools::load_mods('tasks')

require "rake/testtask"
desc "Test"
Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/test_*.rb"]
end


desc "List all tasks"
task :list do
  exec("bundle exec rake -T")
end

task default: %w[list]
