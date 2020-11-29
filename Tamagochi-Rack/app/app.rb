require 'rack'
require 'erb'
require_relative 'pet'

def erb(template)
  path = File.expand_path("#{template}")
  ERB.new(File.read(path)).result(binding)
end

app = Proc.new do |env|
  @var = "Alberto"
  ['200', {'Content-Type' => 'text/html'}, [erb("index.html.erb")]]
end

pet = Pet.new("cat")

Rack::Handler::WEBrick.run app