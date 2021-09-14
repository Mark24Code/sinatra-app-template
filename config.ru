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
  'helpers',
  'bases',
  'controllers'
]

setups.each do |setup_step|
  Dir.glob("./{#{setup_step}}/*.rb").sort.each { |file| require file }
end

# routers(handy config)
map '/' do
  run RootController 
end
