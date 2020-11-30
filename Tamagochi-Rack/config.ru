require './app/pet'
require 'rack'

use Rack::Reloader

use Rack::Static
run App.new

