class Controller

  def initialize(request)
    @_request = request
  end

  def request
    @_request
  end

  def erb(filename)
    Template.render(filename, self)
  end

  def get_binding
    binding
  end

end
