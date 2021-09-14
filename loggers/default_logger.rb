require 'logger'

module Loggers

  class << self
    environment = Config.current.app_env
    @logger = Logger.new(File.open(File.expand_path(File.join($PROJECT_DIR,"log/#{environment}.log")), 'a'))
    @logger.level = Logger::DEBUG if environment == 'development'

    def base
      @logger
    end
  end
end