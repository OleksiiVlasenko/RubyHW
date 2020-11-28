require './app'
use Rack::Reloader
use MyRackMiddleware
run MyApp.new