require 'rack'
require 'erb'

def erb(template)
  path = File.expand_path("#{template}")
  ERB.new(File.read(path)).result(binding)
end

app = Proc.new do |env|
  @var = "Alberto"
  ['200', {'Content-Type' => 'text/html'}, [erb("index.html.erb")]]
end

Rack::Handler::WEBrick.run app