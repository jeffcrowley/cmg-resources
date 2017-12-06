source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
#ruby '2.4.1'
gem 'rails', '~> 5.1.4'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end
group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise' #https://github.com/plataformatec/devise
gem 'jquery-rails'
gem 'simple_form' #https://github.com/jamesfwz/materialize-form
gem 'materialize-sass' #https://github.com/jamesfwz/materialize-form
gem 'materialize-form' #https://github.com/jamesfwz/materialize-form
gem 'faker' #https://github.com/stympy/faker
gem 'figaro' #https://github.com/laserlemon/figaro
group :development do
  gem 'better_errors'
  gem 'letter_opener' #https://github.com/ryanb/letter_opener
end
group :development, :test do
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rubocop' #https://github.com/bbatsov/rubocop
  gem 'sqlite3'
end
group :production do
  gem 'pg'
end
