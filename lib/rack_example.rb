$:.unshift File.dirname(__FILE__)

require 'monkey_extensions'

require 'erb'
require 'haml'

require 'request'
require 'response'
require 'router'
require 'template'
require 'controller'

module RackExample

  class Application
    def call(env)
      request = Request.new(env)
      require 'config/routes.rb'
      Router.route(request)

      Router.route(request)
    end
  end

  class ResponseTimer
    def initialize(app, message = "Response Time")
      @app = app
      @message = message
    end

    def call(env)
      @start = Time.now
      @status, @headers, @response = @app.call(env)
      @stop = Time.now
      [@status, @headers, self]
    end

    def each(&block)
      block.call("<!-- #{@message}: #{@stop - @start} -->\n") if @headers["Content-Type"].include? "text/html"
      @response.each(&block)
    end
  end

end
