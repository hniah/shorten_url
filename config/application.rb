require_relative "boot"

require "rails/all"
Bundler.require(*Rails.groups)

module ShortenerUrl
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.eager_load_paths += ["#{config.root}/lib"]
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

    config.middleware.use Rack::Attack
  end
end
