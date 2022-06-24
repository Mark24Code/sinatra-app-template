require_relative './config/auto'

Config.load_tasks

desc 'List all tasks'
task :list do
  exec('bundle exec rake -T')
end

task default: %w[list]
