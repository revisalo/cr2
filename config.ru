#  This file is u s e d by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run Cr2::Application
