module Template

	def self.render(filename, context, engine = 'erb')
		@driver = "template/#{engine}_engine".camelize.constantize.new(filename)
		@driver.render(context)
	end
	
	
	
	class ErbEngine
		def initialize(filename)
			@template = ERB.new(File.read("app/views/#{filename}.erb"))
		end
		
		def render(context)
			@template.result(context.get_binding)
		end
	end
	
	
end
