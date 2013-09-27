gem_group :development do
  gem 'bullet', '~> 4.6.0'
end

gem_group :development, :test do
  gem 'simplecov'
  gem 'rspec-rails', '~> 2.14.0'
  gem 'cucumber-rails', :require => false
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'railroady'
  gem 'autotest'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'guard-cucumber'
end

gem_group :assets do
  gem 'ember-rails'
  gem 'ember-source', '1.0.0'
  gem 'handlebars-source'
  gem "quiet_assets"
end

gem 'therubyracer'
gem 'whenever', :require => false
gem 'active_model_serializers'
run "bundle install"

application do
  <<-TEST
  config.generators do |g|
     g.test_framework :rspec, fixture: true
     g.fixture_replacement :factory_girl, dir: 'spec/factories'
  end
  TEST
end

environment nil, env: 'development' do
  <<-CONF
  config.after_initialize do
    Bullet.enable = true
    Bullet.alert = true
    Bullet.bullet_logger = true
    Bullet.console = true
    Bullet.rails_logger = true
  end
  # emberjs
  config.ember.variant = :development
  CONF
end

environment "config.ember.variant = :production", env: 'production'

generate "ember:install", "--head"
generate "ember:bootstrap", "--javascript-engine coffee"
generate "rspec:install"
generate "cucumber:install"

file '.rspec',<<-CONF
--color
-f d
CONF

run "guard init"
run "rm public/index.html"

git :init
git add: "."
git commit: %Q{ -m 'Initial Commit From Custom Template' }
rake "db:create"
