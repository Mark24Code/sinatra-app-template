# Sinatra Doc http://sinatrarb.com/intro.html
require 'config/base'

class Root < BaseApp

  get '/' do
    locals = {
      content: "apps/root.rb"
    }
    erb :root, :layout => :base, :locals => locals
  end


  get '/json' do
    
    json({
      data: 'hello json'
    })
  end
end