$:.unshift File.dirname(__FILE__)

require 'monkey_extensions'

require 'erb'

require 'request'
require 'response'
require 'router'
require 'template'
require 'controller'

class RackExample

  def call(env)
  	request = Request.new(env)
  	require 'config/routes.rb'
  	Router.route(request)
  	
  	#data = []
  	#env.each_pair { |key, value| data << "#{key} => #{value}" }
  	#[200, {"Content-Type" => "text/html"}, data.join("<br/>")]
  	
  	Router.route(request)
  end
  
end
