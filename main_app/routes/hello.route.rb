App.define_routes do

  get '/' do
    json({
      message: 'hello world'
    })
  end
end