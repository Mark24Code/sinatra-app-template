# Sinatra Doc http://sinatrarb.com/intro.html
require 'config/base'

class Root < BaseApp

  get '/' do
    return @@app_config.to_json
  end

end