require 'logger'
require_relative '../prepare'

$LOGGER = Logger.new(File.open(File.expand_path(File.join($PROJECT_DIR,"log","#{$APP_ENV}.log")),'a'))
$LOGGER.level = Logger::DEBUG if $APP_ENV == 'development'
