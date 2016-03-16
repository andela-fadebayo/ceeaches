source 'https://rubygems.org'
ruby '2.3.0'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# Use Puma web server for Heroku deployment
gem 'puma'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Removing Turbolinks since it's designed for a different type of application than that one you'd make with Angular.
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# bower-rails will bridge our Rails application with Bower
gem 'bower-rails'

# Angular caches templates after it requests them the first time, so we really just need to pre-populate that cache.
# This way, Angular won't need to request any assets, thus eliminating both the asset pipeline problem as well as
# the same-origin security policy.
gem 'angular-rails-templates'

# Note that we're also pinning version 3.2.19 of the sass gem.
# Currently, a bug in sprockets and/or SASS prevents everything from working as designed,
# so we need to stay on this version for now.
gem 'sass', '3.2.19'

# Heroku-specific gems
gem 'foreman'

group :production, :staging do
  gem 'rails_12factor'
  gem 'rails_stdout_logging'
  gem 'rails_serve_static_assets'
end

group :test, :development do
  gem 'rspec-rails', '~> 2.0'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'teaspoon-jasmine'
  gem 'phantomjs'
  gem 'pry-rails'
end
