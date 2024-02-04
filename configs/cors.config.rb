# https://github.com/jdesrosiers/sinatra-cors
class App < Sinatra::Base
  configure do
    set :allow_origin, '*'
    set :allow_methods, 'GET,POST,PUT,DELETE,HEAD,OPTIONS'
    set :allow_headers, 'content-type,if-modified-since,allow_headers'
  end

  configure :development do
    set :allow_origin, '*'
  end

  configure :production do
    # set :allow_origin, '<your domin>'
  end
end
