require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsStarterApp
  class Application < Rails::Application

    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
    end

    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    # read a config file at location /config/local_env.yml
    # this contains env variables
    # DATABASE_USERNAME
    # DATABASE_USERPASSWORD
    # DATABASE_NAME

    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end

  end
end
