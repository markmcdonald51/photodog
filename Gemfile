source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
#gem "rails", "~> 7.1.3.4"
gem "rails", "~> 8.0.2"
# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"
# Use sqlite3 as the database for Active Record
gem "sqlite3"#, ">= 1.4"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"
# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

gem 'digest'
gem "blake3-rb"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

gem 'colored'
gem 'simple_form'
gem 'slim-rails'
gem 'geocoder'
gem 'aasm'
#gem "bootstrap5_helper"
#gem 'acts_as_tree'
#gem 'acts_as_list'
gem 'cancancan'
#gem 'will_paginate'
#gem 'will_paginate-bootstrap5'
gem 'kaminari'
gem 'bootstrap5-kaminari-views'
gem 'holder_rails'

gem 'mountable_locations',   path: "vendor/gems" #, github: 'markmcdonald51/mountable_locations',

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
  gem 'streamio-ffmpeg'
  gem 'pry-rails'

  # Photo metadata https://github.com/tonytonyjan/exif
  #gem 'exif' # sudo dnf install libexif-devel.x86_64

  #gem 'railroady'
  #gem 'rspec-rails'
  #gem 'faker'
  #gem "factory_bot_rails"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end
gem "cssbundling-rails"
gem "devise", "~> 4.9"
gem "friendly_id", "~> 5.4"
gem "jsbundling-rails"
gem "madmin"
gem "name_of_person", github: "basecamp/name_of_person"
gem "noticed", "~> 2.0"
gem "omniauth-facebook", "~> 8.0"
gem "omniauth-github", "~> 2.0"
gem "omniauth-twitter", "~> 1.4"
gem "pretender", "~> 0.3.4"
gem "pundit", "~> 2.1"
gem "sidekiq", "~> 6.2"
gem "sitemap_generator", "~> 6.1"
gem "whenever", require: false
gem "responders", github: "heartcombo/responders", branch: "main"
