class HomeController < Controller

  def index
    @title = "Rack Example"
    erb 'home/index'		
  end

end
