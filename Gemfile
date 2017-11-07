source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'awesome_print', require: 'ap'
gem 'aws-sdk'
gem 'bcrypt', '~> 3.1.11'
gem 'bootstrap', '>= 4.0.0.beta'
gem 'cancancan'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'font-awesome-sass', '>= 4.7.0'
gem 'haml-rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
#gem 'mysql2'
gem 'paperclip'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'ransack'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'sprockets-rails', require: 'sprockets/railtie'
gem 'truncate_html'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'will_paginate'
group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'sqlite3'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
