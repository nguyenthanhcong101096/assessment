source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.5', '>= 6.1.5.1'
# Use sqlite3 as the database for Active Record
gem 'pg', '~> 1.2', '>= 1.2.3'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

gem 'jwt'
gem 'active_model_serializers'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner'
  # Pry is a runtime developer console and IRB alternative with powerful
  # Great Ruby dubugging companion: pretty print Ruby objects to visualize
  # their structure. Supports custom object formatting via plugins
  gem 'awesome_print', '~> 1.9.2'
  # Automatic Rails code style checking tool
  gem 'rubocop', '~> 1.29', require: false
  gem 'rubocop-rails', '~> 2.12', '>= 2.12.2', require: false
  gem 'rubocop-rspec', '~> 2.10', require: false
  gem 'rubocop-performance', '~> 1.13', '>= 1.13.3', require: false
  gem 'rubocop-rake', '~> 0.6.0', require: false
end

group :test do
  gem 'simplecov', require: false
  gem 'rails-controller-testing'
  gem 'rspec_junit_formatter'
  gem 'rspec-json_matcher'
  gem 'shoulda-matchers'
  gem 'factory_bot_rails'
  gem 'timecop'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails", "~> 4.0.1"
  gem 'factory_bot_rails'
  gem 'faker'
  
  gem 'pry', '~> 0.13.1'
  gem 'pry-rails', '~> 0.3.9'
  gem 'pry-byebug', '~> 3.9'
  gem 'pry-doc', '~> 1.1'
  gem 'pry-rescue', '~> 1.5', '>= 1.5.2'
end

# Authentication
gem 'devise', '~> 4.7.2'
gem 'devise-security', '0.14.3'

# Haml rails
gem 'haml-rails', '~> 2.0', '>= 2.0.1'
gem 'kaminari', '1.2.1'

# Parse html
gem 'nokogiri'

# Configuration
gem 'dotenv-rails', '2.7.6'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'js-routes'