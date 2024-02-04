require 'sinatra/base'
require 'sinatra/contrib'
require 'sinatra/cors'

# Sinatra Doc http://sinatrarb.com/intro.html
class App < Sinatra::Base
  # Help Doc http://sinatrarb.com/contrib/
  register Sinatra::Contrib
  # https://github.com/jdesrosiers/sinatra-cors
  register Sinatra::Cors

  configure :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
  end

  # require_relative '../loggger.config'
  require_relative '../setting.config'
  require_relative '../cors.config'
  require_relative '../logger.config'
  require_relative '../server.config'
  require_relative '../database.config'
  require_relative '../connect_sequel.config'
end
