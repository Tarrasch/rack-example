class HomeController < Controller

  def index
    @title = "Rack Example"
    haml 'home/index'		
  end

end
