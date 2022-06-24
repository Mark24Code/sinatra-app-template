require "logger"
require "pathname"


module Config
  module LogMan
    class << self
      environment = Config::Setting.current.app_env
      @@logger = ::Logger.new(File.open(Pathname.new(Config::ROOT_DIR + "./logs/#{environment}.log"), "a"))
      @@logger.level = ::Logger::DEBUG if environment == "development"

      def base
        @@logger
      end
    end
  end
end

