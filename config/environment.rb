# Load the Rails application.
require File.expand_path('../application', __FILE__)

require 'net/http'
require 'open-uri'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
env_config = YAML.load_file(APP_ROOT.join('config', 'zoho.yml'))

env_config.each do |key, value|
  ENV[key] = value
end

# Initialize the Rails application.
Rails.application.initialize!
