require "logger"
require "pathname"

# http://sinatrarb.com/contrib/custom_logger
class App < Sinatra::Base
  configure do
    logger = ::Logger.new(File.open(Pathname.new(settings.root + "./logs/#{settings.app_env}.log"), "a"))
    logger.level = ::Logger::DEBUG if settings.development?
    set :logger, logger
  end
end

