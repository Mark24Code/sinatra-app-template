Dir['./tasks/*.task.rb'].sort.each do |model_file|
  require_relative model_file
end

desc 'List all tasks'
task :list do
  exec('bundle exec rake -T')
end

task default: %w[list]
