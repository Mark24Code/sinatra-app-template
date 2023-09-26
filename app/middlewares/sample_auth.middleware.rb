class Authenticator
  def initialize(app)
    @app = app
  end

  def call(env)
    if Rack::Request.new(env).params['my_token'] == 'MY_SECRET_TOKEN'
      @app.call(env)
    else
      Rack::Response.new([], 401, {}).finish
    end
  end
end
