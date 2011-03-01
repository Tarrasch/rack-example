class HomeController < Controller

	def index
		@title = "Reck Example"
		erb 'home/index'		
	end
	
end
