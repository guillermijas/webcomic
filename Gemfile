source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'awesome_print', require: 'ap'
gem 'aws-sdk', '~> 3'
gem 'bootstrap', '~> 4.0.0.beta'
gem 'cancancan'
gem 'devise'
gem 'figaro'
gem 'font-awesome-sass', '~> 4.7.0'
gem 'haml-rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'mysql2'
gem 'paperclip'
gem 'puma'
gem 'rails', '~> 5.1.1'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'sass-rails', '~> 5.0'
gem 'seed_dump'
gem 'simple_form', '~> 3.2', '>= 3.2.1'
gem 'sprockets-rails'
gem 'sqlite3'
gem 'truncate_html'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'capistrano'
  gem 'capistrano3-puma'
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rvm'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

