source 'https://rubygems.org'

ruby '2.7.8'

gem "bundler", ">= 1.8.4"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.8', '>= 5.2.8.1'
# Psych 4+ disables YAML aliases by default, which breaks settingslogic's
# config.yml (it uses `&defaults`/`*defaults`). Rails 5.2 targets psych 3.x anyway.
gem 'psych', '~> 3.3'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '>= 4.4.0'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
# Kept at 0.4.x: newer sdoc needs rdoc 6+, which requires psych 4+ (see psych pin above).
# sdoc/rdoc are doc-generation only (:doc group, never loaded at runtime).
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'jquery-turbolinks'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
# Mitigates OmniAuth CVE-2015-9284 (login CSRF) by validating the request phase
gem 'omniauth-rails_csrf_protection'
gem 'meta-tags'
gem 'devise', '~> 4.9'
gem 'simple_form', '~> 5.1'
gem 'slim-rails', '~> 3.1'
gem 'factory_bot_rails'
gem 'kaminari'
gem 'settingslogic'
gem 'pg', '~> 1.5'
gem 'ransack'
# NOTE: 5.3.0 (fixes CVE-2019-8331) requires Ruby >= 3.0, which Rails 5.2 cannot run.
# Staying on 5.1.0; the Bootstrap tooltip/popover XSS needs attacker-controlled
# data-template, which this app does not use, so real-world risk is low.
gem "twitter-bootstrap-rails"
gem "font-awesome-rails"
gem 'redactor-rails', git: 'https://github.com/billy3321/redactor-rails.git'
gem "carrierwave", '~> 1.3'
gem "mini_magick"
# gem 'lograge'
gem "rails-i18n", '~> 5.1'
gem 'whenever', require: false
gem 'chosen-rails'
gem 'lograge'
gem 'unicode-display_width'

# Throttle abusive requests / brute-force login attempts at the Rack layer
gem 'rack-attack'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails', '~> 4.0'
  gem "capybara", '~> 3.36'
  gem "bullet"
  # Static analysis security scanner & dependency CVE auditor
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.7'

  # NOTE: spring (the dev preloader) was removed during the Rails 5.2 / Ruby 2.7
  # upgrade — spring 4.x is incompatible with this app's boot ("Rails::Application
  # is abstract"). The app runs fine without it; re-add a compatible spring later
  # if the faster `bin/rails` boot is wanted.
end
