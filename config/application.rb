require File.expand_path('../boot', __FILE__)
%w(
  action_controller/railtie
  action_view/railtie
  action_mailer/railtie
  active_job/railtie
  action_cable/engine
  rails/test_unit/railtie
  sprockets/railtie
).each do |railtie|
  begin
    require railtie
  rescue LoadError
  end
end

# require "action_controller/railtie"
# require "action_mailer/railtie"
# #require "active_resource/railtie" # Comment this line for Rails 4.0+
# require "rails/test_unit/railtie"
# require "sprockets/railtie" # Uncomment this line for Rails 3.1+
# require "action_cable"
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Ac
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    Mongoid.load!(Rails.root.join("config/mongoid.yml"))
    config.time_zone = "Hanoi"
  end
end
