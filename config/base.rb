# Sinatra Doc http://sinatrarb.com/intro.html
require 'sinatra/base'
require 'tools'
require 'json'

module App
  class Base < Sinatra::Base
    @@app_config = Tools::app_config('config/base_config.yml')
 
    # Sinatra Middlewares
    # Help Doc http://sinatrarb.com/contrib/

  end
end

