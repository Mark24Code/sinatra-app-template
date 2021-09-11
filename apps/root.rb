# Sinatra Doc http://sinatrarb.com/intro.html
require 'sinatra/base'

class Root < Sinatra::Base

  get '/' do
    'Hello Wolrd'
  end

end