source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bootstrap-sass"
gem "carrierwave", "1.2.2"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "figaro"
gem "fog", "1.42"
gem "font-awesome-rails"
gem "jbuilder", "~> 2.5"
gem "jquery-datatables-rails", "~> 3.4.0"
gem "jquery-rails"
gem "kaminari"
gem "mini_magick", "4.7.0"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.6"
gem "rubocop", require: false
gem "sass-rails", "~> 5.0"
gem "sqlite3"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "unf"
gem "jquery-turbolinks"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
