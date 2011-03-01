class Response

	DEFAULT_OPTIONS = {
		"Content-Type" => "text/plain; charset=utf-8;"
	}

	def initialize(status, data, options = {})
		@status = status
		@options = DEFAULT_OPTIONS.merge(options)
		@data = data
	end
	
	
	def get
		[@status, @options, @data]
	end

end
