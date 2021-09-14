require_relative './cores/bootstrap'
Bootstrap.rake

desc "List all tasks"
task :list do
  exec("bundle exec rake -T")
end

task default: %w[list]
