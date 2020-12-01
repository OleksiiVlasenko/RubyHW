require './app/pet'
require 'rack'
require_relative './app/pet'

use Rack::Reloader
use Rack::Auth::Basic do |username, password|
  username == 'asd' && password == 'asd'
end
use Rack::Static
run App.new

