class App < Sinatra::Base
  get '/' do
    json({
      message: 'hello world'
    })
  end
end
