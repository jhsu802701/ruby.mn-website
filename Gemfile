source 'https://rubygems.org'

##############################################
# BEGIN: gems that take a long time to install
##############################################
# Please pre-install the proper versions in the Docker image.
gem 'rails', '3.2.22.1'
gem 'pg', '0.17.1'
############################################
# END: gems that take a long time to install
############################################

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '3.2.1'
  gem 'uglifier', '2.7.2'
  gem 'compass-rails', '1.1.3'
end

gem 'sass-rails', '3.2.6'

gem 'jquery-rails', '3.1.4'
# gem "ruby-recaptcha", '~> 1.0.3', :require => 'recaptcha'
gem "recaptcha", '0.3.6', :require => "recaptcha/rails"
gem "haml", '4.0.5'
gem 'haml-rails', '0.4'
gem 'rdiscount', '2.1.7'
gem "paperclip", '4.3.1'
gem 'rails_autolink', '1.0.9'
gem 'dynamic_form', '1.1.4'
gem 'gravatarify', '3.0.0'
gem 'kaminari', '0.13.0'
gem 'chronic', '0.9.1'
gem 'unicorn', '5.0.1'

group :development do
  gem 'rails3-generators', '0.17.4'
  gem 'foreman', '0.63.0'
end

group :test do
  gem 'shoulda', '3.0.1'
  gem 'shoulda-context', '1.0.2'
  gem 'shoulda-matchers', '1.0.0'
  gem 'test-unit', '2.4.9'
  gem 'mocha', '1.0.0'
  gem 'rdoc', '3.12.2'
  gem 'rb-fsevent', '0.9.4', :require => false
  gem 'rb-fchange', '0.0.6', :require => false
  gem 'guard', '0.6.3'
  gem 'guard-test', '0.3.0'
  gem 'guard-bundler', '0.1.3'
end

group :test, :development do
  gem 'faker', '1.2.0'
  gem 'progress_bar', '0.4.1'
  gem 'factory_girl_rails', '1.5.0'
end

group :production do
  gem 'rack-cache', '1.6.1'
  gem 'rack-contrib', '1.1.0'
  gem 'dalli', '1.1.5'
  gem 'memcachier', '0.0.2'
end

# BEGIN: for outline.sh
group :development do
  gem 'annotate', '2.6.5' # Adds comments listing parameters and the output of "rails routes"
  gem 'railroady', '1.3.1' # Generates block diagrams
  gem 'rails-erd', '1.4.2' # Generates block diagrams
end
# END: for outline.sh

# BEGIN: gems used in test_code.sh script
group :development, :testing do
  gem 'brakeman', '3.1.0' # Checks for security vulnerabilities
  gem 'bundler-audit', '0.3.0' # Checks for vulnerable versions of gems
  gem 'gemsurance', '0.6.0' # Checks for outdated and insecure gems
  gem 'sandi_meter', '1.2.0' # Checks for compliance with Sandi Metz' four rules
end
# END: gems used in test_code.sh script

# BEGIN: gems used for setting up PostgreSQL in the development environment
# NOTE: Attempts to use "gem install" in the PostgreSQL setup scripts did not pan out.
gem 'figaro', '1.1.1'
gem 'line_containing', '0.1.0'
gem 'remove_double_blank', '0.0.0'
gem 'string_in_file', '0.1.2'
# END: gems used for setting up PostgreSQL in the development environment
