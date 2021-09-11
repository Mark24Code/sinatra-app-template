# Sinatra Doc http://sinatrarb.com/intro.html
require 'config/base'

class Root < App::Base

  get '/' do
    return @@app_config.to_json
  end

end