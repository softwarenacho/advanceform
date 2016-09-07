# Load the Rails application.
require File.expand_path('../application', __FILE__)

require 'net/http'
require 'open-uri'
require 'addressable/uri'
require 'pp'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

def development_yml
	env_config = YAML.load_file(APP_ROOT.join('config', 'zoho.yml'))
	env_config.each do |key, value|
	  ENV[key] = value
	end
end

dev_file = File.join(Rails.root, 'config', 'zoho.yml')

development_yml if File.exists?(dev_file)

# Initialize the Rails application.
Rails.application.initialize!
