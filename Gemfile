source 'https://rubygems.org'

ruby '3.4.4'

gem "bundler", ">= 1.8.4"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 8.1.4'
gem 'sprockets-rails'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'
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

gem 'jquery-turbolinks'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
# Mitigates OmniAuth CVE-2015-9284 (login CSRF) by validating the request phase
gem 'omniauth-rails_csrf_protection'
gem 'meta-tags'
gem 'devise', '~> 5.0', '>= 5.0.4'
gem 'simple_form', '~> 5.3'
gem 'slim-rails', '~> 3.1'
gem 'factory_bot_rails'
gem 'kaminari'
gem 'pg', '~> 1.5'
gem 'ransack'
# Bootstrap 3.4.1 (fixes CVE-2019-8331) is vendored in vendor/assets/*/bootstrap3; twitter-bootstrap-rails
# 5.3+ switched to Bootstrap 5, which this Bootstrap 3 UI can't use.
gem "font-awesome-rails"
gem 'redactor-rails', git: 'https://github.com/billy3321/redactor-rails.git'
gem "carrierwave", '~> 3.1', '>= 3.1.4'
gem "mini_magick"
# gem 'lograge'
gem "rails-i18n", '~> 8.0'
gem 'whenever', require: false
# chosen-rails only auto-loads its asset engine on Rails 4-7; load it explicitly for Rails 8.
gem 'chosen-rails', require: ['chosen-rails', 'chosen-rails/engine']
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
  gem 'rspec-rails', '~> 8.0'
  gem "capybara", '~> 3.40'
  gem "bullet"
  # Static analysis security scanner & dependency CVE auditor
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 4.2'
  # WEBrick is no longer bundled with Ruby 3; dev server for `bin/rails s`
  gem 'puma'

end
