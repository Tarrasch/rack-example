module Template

  def self.render(filename, context, engine = 'haml')
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

  class HamlEngine
    def initialize(filename)
      @template = Haml::Engine.new(File.read("app/views/#{filename}.haml"))
    end

    def render(context)
      @template.render(context.get_binding)
    end
  end

end
