class Router

	@@maps = {}
	
	
	class << self
	
		def route(request)	
		
			route = @@maps[request.request_path]
			unless route.nil?
				require "app/controllers/#{route[:controller]}_controller"
				controller = "#{route[:controller]}_controller".camelize.constantize.new(request)
			
				data = controller.send(route[:action])
		
				response = Response.new(200, data)
				response.get	
			else
				response = Response.new(200, @@maps.inspect)
				response.get	
			end	
		end

		def map(&block)
			class_eval(&block)
		end
		
		
		def m(path, params)
			route = {}
			route[:controller] = params[:controller]
			route[:action] = params[:action] ? params[:action] : 'index'
			@@maps[path] = route
		end

	end
	
	

end
