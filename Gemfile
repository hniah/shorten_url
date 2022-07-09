source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'


gem 'rails', '~> 6.1.5', '>= 6.1.5.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'webpacker', '~> 5.0'
gem 'active_model_serializers'
gem 'bootsnap', '>= 1.4.4', require: false

# Environment
gem 'figaro'

# Rack middleware
gem 'rack-attack'

# Database partition
gem 'pg_party'

# Seed
gem 'seedbank'
gem 'faker'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_bot_rails'

  # show error better
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'

  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'selenium-webdriver', '>= 4.0.0.rc1'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
