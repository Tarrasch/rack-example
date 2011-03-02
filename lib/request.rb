class Request

  attr_reader :method, :query_string, :request_path, :GET, :POST

  def initialize(env)
    @method = env["REQUEST_METHOD"].downcase
    @query_string = env["QUERY_STRING"].strip
    @request_path = env["REQUEST_PATH"]
    parse_query_string
  end


  protected

    def parse_query_string
      params = {}
      @query_string.split("&").each do |param| 
        pair = param.split("=")
        key = pair[0]
        value = pair[1] ? pair[1] : false
        params[key.to_sym] = value
      end if @query_string
      @GET = params
    end

end
