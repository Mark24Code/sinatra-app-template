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

  # require_relative '../config/loggger'
  require_relative '../config/cors'
end
