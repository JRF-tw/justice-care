require File.expand_path('../boot', __FILE__)

require 'rails'
# Only the frameworks this app uses (no Active Storage / Action Cable / Mailbox / Text).
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# Needed by environment configs and initializers, before autoloading is available.
require_relative 'setting'

module JusticeCare
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = 'Taipei'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.default_locale = "zh-TW"
    config.autoload_lib(ignore: %w(assets tasks templates))

    config.exceptions_app = self.routes

    # Rails 7.2 no longer reads config/secrets.yml. Keep honouring the deployed
    # (gitignored) secrets.yml so existing sessions stay valid; SECRET_KEY_BASE wins.
    secrets_file = root.join('config', 'secrets.yml')
    if ENV['SECRET_KEY_BASE'].blank? && secrets_file.exist?
      secrets = YAML.safe_load(ERB.new(secrets_file.read).result, aliases: true) || {}
      config.secret_key_base = secrets.dig(Rails.env, 'secret_key_base').presence
    end
  end
end
