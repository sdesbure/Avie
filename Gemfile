require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']
source 'https://rubygems.org'
#Rails in version 3.2.3
gem 'rails', '~> 3.2.3'

#Database Management
gem 'sqlite3'

#Jquery for Javascript Library
gem 'jquery-rails'

#Haml for templating
gem "haml", ">= 3.1.5"

#SimpleForm for creating forms
gem "simple_form"

#Pagination of results
gem "will_paginate", ">= 3.0.3"

#Devise for User Managemant and CanCan and Rolify for role management
gem "devise", ">= 2.1.0.rc2"
gem "cancan", ">= 1.6.7"
gem "rolify", ">= 3.1.0"

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem "twitter-bootstrap-rails", ">= 2.0.3"
  gem "therubyracer", :platform => :ruby
end

group :development do
  gem "haml-rails", ">= 0.3.4"
  gem "guard", ">= 0.6.2"
  case HOST_OS
    when /darwin/i
      gem 'rb-fsevent'
      gem 'growl'
    when /linux/i
      gem 'libnotify'
      gem 'rb-inotify'
    when /mswin|windows/i
      gem 'rb-fchange'
      gem 'win32console'
      gem 'rb-notifu'
  end
  gem "guard-bundler", ">= 0.1.3"
  gem "guard-rails", ">= 0.0.3"
  gem "guard-rspec", ">= 0.4.3"
  gem "guard-cucumber", ">= 0.6.1"
end

group :test do
  gem "email_spec", ">= 1.2.1"
  gem "cucumber-rails", ">= 1.3.0"
  gem "capybara", ">= 1.1.2"
  gem "database_cleaner", ">= 0.7.2"
  gem "launchy", ">= 2.1.0"
end

group :development, :test do
  gem "rspec-rails", ">= 2.10.1"
  gem "factory_girl_rails", ">= 3.2.0"
end

