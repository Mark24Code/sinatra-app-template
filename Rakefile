# Help Doc https://ruby.github.io/rake/doc/rakefile_rdoc.html

# Auto Setup
# auto import ordered setup modules
# you can change file name for controlling relative require order.  
# e.g 01_first_setup, 02_next_setup
setups = [
  'setups',
  'cores',
  'configs',
  'loggers',
  'dbs',
  'models',
  'seeds',
  'tests',
  'tasks'
]

setups.each do |setup_step|
  Dir.glob("./{#{setup_step}}/*.rb").sort.each { |file| require file }
end

desc "List all tasks"
task :list do
  exec("bundle exec rake -T")
end

task default: %w[list]
