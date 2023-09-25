# http://sinatrarb.com/contrib/custom_logger
class App < Sinatra::Base
  configure do
    set :logger, Config::LogMan.base
  end
end

