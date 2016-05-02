source 'https://rubygems.org'

local_gemfile = File.dirname(__FILE__) + "/Gemfile.local"
if File.file?(local_gemfile)
  self.instance_eval(Bundler.read_file(local_gemfile))
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use compass
gem 'compass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc
# Use haml
gem 'haml'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Making bootstrap available
gem 'bootstrap-generators', '~> 3.1.1'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'
gem 'bootstrap-datepicker-rails'

# embeddes the jQuery colorpicker in the Rails asset pipeline.
gem 'jquery-minicolors-rails'

# provides the Tipsy jQuery plugin
gem 'tipsy-rails'

# Dump (parts) of your database to db/seeds.rb
gem 'seed_dump'

# Flexible authentication solution for Rails with Warden
gem 'devise', '~> 3.5.2'
# generalized Rack framework for multiple-provider authentication.
gem 'omniauth', '~> 1.2.2'
# OmniAuth strategy for Redmine
gem 'omniauth-redmine', '~> 0.0.2'

# collection of Ruby methods to deal with statutory and other holidays
gem 'holidays'
# ice_cube is a recurring date library for Ruby
gem 'ice_cube'
# provides a useful interface for creating recurring rules for the ice_cube gem
gem 'recurring_select'

# Turns off Rails asset pipeline log.
gem 'quiet_assets', '~> 1.1'

group :development do
	# Capybara helps you test web applications by simulating how a real user would interact with your app.
	#gem 'capybara'
	# testing framework for Rails 3.x and 4.x.
	#gem 'rspec-rails'
  # Provides a better error page
  gem 'better_errors', '~> 2.1', '>= 2.1.1'
  # Profiling toolkit for Rack applications
  gem 'rack-mini-profiler', '~> 0.9.9.2'
  # Help to kill N+1 queries and unused eager loading.
  gem 'bullet', '~> 5.0'
end
