require "logger"
require "pathname"


module Boot
  module LogMan
    class << self
      environment = Boot::Setting.current.app_env
      @@logger = ::Logger.new(File.open(Pathname.new(Boot::ROOT_DIR + "./logs/#{environment}.log"), "a"))
      @@logger.level = ::Logger::DEBUG if environment == "development"

      def base
        @@logger
      end
    end
  end
end

