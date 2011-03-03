require 'rubygems'
require 'rack'
require 'lib/rack_example'

use RackExample::ResponseTimer
run RackExample::Application.new
