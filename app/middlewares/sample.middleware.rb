module Middleware
  class Sample
    def initialize(app)
      @app = app
      @header = {}
    end

    def payload(request)
      data = request.body.read
      # reset reader pointer
      request.body.rewind
      return data
    end

    def params(request)
      return request.params
    end

    def call(env)
      @request = Rack::Request.new(env)

      puts "Time: #{Time.now}"
      @app.call(env)

      # 直接返回
      # return Rack::Response.new([message], 200, @header).finish
    end
  end
end
