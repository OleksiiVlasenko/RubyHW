class MyApp
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["Hello Rack Participants"] ]
  end
end
class MyRackMiddleware
  def initialize(appl)
    @apppl = appl
  end
  def call(env)
    status, headers, body = @apppl.call(env)
    apend_s = " some text"
    [status, headers, body << apend_s+"11"]
  end
end
