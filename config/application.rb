require_relative 'boot'
require 'csv'
require 'json'
require 'rails/all'

Bundler.require(*Rails.groups)

module Project2
  class Application < Rails::Application
    config.load_defaults 5.1

    config.i18n.default_locale = :vi
    config.generators do |g|
      g.template_engine false
      g.test_framework false
      g.assets false
      g.helper false
    end
  end
end
