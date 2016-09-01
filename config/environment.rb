# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

env_config = YAML.load_file(APP_ROOT.join('config', 'zoho.yaml'))

env_config.each do |key, value|
  ENV[key] = value
end
