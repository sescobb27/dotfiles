DEVISE = <<-OAUTH

  require 'omniauth-twitter'
  require 'omniauth-gplus'
  require 'omniauth-facebook'
      config.omniauth :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET'], :strategy_class => OmniAuth::Strategies::Twitter
=begin
      url: https://github.com/arunagw/omniauth-twitter
      :twitter => Here's an example Auth Hash available in request.env['omniauth.auth']:
      {
        :provider => "twitter",
        :uid => "123456",
        :info => {
          :nickname => "johnqpublic",
          :name => "John Q Public",
          :location => "Anytown, USA",
          :image => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
          :description => "a very normal guy.",
          :urls => {
            :Website => nil,
            :Twitter => "https://twitter.com/johnqpublic"
          }
        },
        :credentials => {
          :token => "a1b2c3d4...", # The OAuth 2.0 access token
          :secret => "abcdef1234"
        },
        :extra => {
          :access_token => "", # An OAuth::AccessToken object
          :raw_info => {
            :name => "John Q Public",
            :listed_count => 0,
            :profile_sidebar_border_color => "181A1E",
            :url => nil,
            :lang => "en",
            :statuses_count => 129,
            :profile_image_url => "http://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
            :profile_background_image_url_https => "https://twimg0-a.akamaihd.net/profile_background_images/229171796/pattern_036.gif",
            :location => "Anytown, USA",
            :time_zone => "Chicago",
            :follow_request_sent => false,
            :id => 123456,
            :profile_background_tile => true,
            :profile_sidebar_fill_color => "666666",
            :followers_count => 1,
            :default_profile_image => false,
            :screen_name => "",
            :following => false,
            :utc_offset => -3600,
            :verified => false,
            :favourites_count => 0,
            :profile_background_color => "1A1B1F",
            :is_translator => false,
            :friends_count => 1,
            :notifications => false,
            :geo_enabled => true,
            :profile_background_image_url => "http://twimg0-a.akamaihd.net/profile_background_images/229171796/pattern_036.gif",
            :protected => false,
            :description => "a very normal guy.",
            :profile_link_color => "2FC2EF",
            :created_at => "Thu Jul 4 00:00:00 +0000 2013",
            :id_str => "123456",
            :profile_image_url_https => "https://si0.twimg.com/sticky/default_profile_images/default_profile_2_normal.png",
            :default_profile => false,
            :profile_use_background_image => false,
            :entities => {
              :description => {
                :urls => []
              }
            },
            :profile_text_color => "666666",
            :contributors_enabled => false
          }
        }
      }
=end
      config.omniauth :gplus, ENV['GPLUS_KEY'], ENV['GPLUS_SECRET'], :strategy_class => OmniAuth::Strategies::GPlus
=begin
      url: https://github.com/samdunne/omniauth-gplus
      :gplus => Here's an example Auth Hash available in request.env['omniauth.auth']:
      https://developers.google.com/+/api/latest/comments/list#try-it
=end
      config.omniauth :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],  :strategy_class => OmniAuth::Strategies::Facebook
=begin
      url: http://mkdynamic.github.io/omniauth-facebook/
      :facebook => Here's an example Auth Hash available in request.env['omniauth.auth']:
      {
        :provider => 'facebook',
        :uid => '1234567',
        :info => {
          :nickname => 'jbloggs',
          :email => 'joe@bloggs.com',
          :name => 'Joe Bloggs',
          :first_name => 'Joe',
          :last_name => 'Bloggs',
          :image => 'http://graph.facebook.com/1234567/picture?type=square',
          :urls => { :Facebook => 'http://www.facebook.com/jbloggs' },
          :location => 'Palo Alto, California',
          :verified => true
        },
        :credentials => {
          :token => 'ABCDEF...', # OAuth 2.0 access_token, which you may wish to store
          :expires_at => 1321747205, # when the access token expires (it always will)
          :expires => true # this will always be true
        },
        :extra => {
          :raw_info => {
            :id => '1234567',
            :name => 'Joe Bloggs',
            :first_name => 'Joe',
            :last_name => 'Bloggs',
            :link => 'http://www.facebook.com/jbloggs',
            :username => 'jbloggs',
            :location => { :id => '123456789', :name => 'Palo Alto, California' },
            :gender => 'male',
            :email => 'joe@bloggs.com',
            :timezone => -8,
            :locale => 'en_US',
            :verified => true,
            :updated_time => '2011-11-11T06:21:03+0000'
          }
        }
      }
=end
  OAUTH
DEVISE.freeze
def prepend file, str
   if File.exist? file
     file_name = File.basename file
     content = open(file, File::RDONLY).read
     open('tmpfile', File::CREAT|File::WRONLY) do |file|
       file.write str
       file.write "#{content}"
     end
     if RUBY_PLATFORM =~ /linux/ then `mv tmpfile #{file_name}`
     else
       File.delete file_name
       File.rename 'tmpfile', file_name
     end
   else
     $stderr.puts 'No such file, creating ...'
     File.open(file, File::CREAT|File::WRONLY).write(str)
   end
end

gem_group :development do
  gem 'bullet', '~> 4.6.0'
  gem 'railroady'
end

gem_group :development, :test do
  gem 'simplecov'
  gem 'rspec-rails'
  gem 'email_spec'
  gem 'cucumber-rails', :require => false
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'autotest'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'rb-readline'
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'guard-cucumber'
  gem "quiet_assets"
end

gem 'ember-rails'
gem 'ember-source'

gem 'therubyracer'
gem 'whenever', :require => false
gem 'active_model_serializers'
gem 'devise'
gem 'omniauth' #https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview
gem 'omniauth-twitter' #https://github.com/arunagw/omniauth-twitter
gem 'omniauth-gplus' #https://github.com/samdunne/omniauth-gplus
gem 'omniauth-facebook' #https://github.com/mkdynamic/omniauth-facebook
gem "twitter-bootstrap-rails"

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
generate "ember:bootstrap"
generate "rspec:install"
generate "cucumber:install", '--capybara', '--rspec'
generate "devise:install"
generate "bootstrap:install", "static"
inject_into_file 'config/initializers/devise.rb', DEVISE, after: "config.omniauth_path_prefix = '/my_engine/users/auth'"

prepend '.rspec',<<-CONF
-f d
CONF

inside('spec') do
  prepend 'spec_helper.rb', <<-SIMPLECOV
require 'simplecov'
SimpleCov.start 'rails'
SIMPLECOV
end

create_file 'spec/support/devise.rb', <<-DEVISE
RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
end
DEVISE

DATABASE_CLEANER = <<-DATABASE

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
DATABASE
DATABASE_CLEANER.freeze

EMAIL_SPEC = <<-EMAIL

config.include(EmailSpec::Helpers)
config.include(EmailSpec::Matchers)
EMAIL
EMAIL_SPEC.freeze

inject_into_file 'spec/spec_helper.rb', "\nrequire 'email_spec'", after: "require 'rspec/rails'"
inject_into_file 'spec/spec_helper.rb', DATABASE_CLEANER, after: "config.order = \"random\""
inject_into_file 'spec/spec_helper.rb', EMAIL_SPEC, after: "RSpec.configure do |config|"


inside('features/support') do
  prepend 'env.rb', <<-SIMPLECOV
require 'simplecov'
SimpleCov.start 'rails'
SIMPLECOV
end

FACTORY_GIRL = <<-GUARD

watch(%r{^spec/factories/(.+)\.rb$}) do |m|
  %W[
    spec/models/\#{m[1].singularize}_spec.rb
    spec/controllers/\#{m[1]}_controller_spec.rb
    spec/requests/\#{m[1]}_spec.rb
  ]
end
GUARD
FACTORY_GIRL.freeze

run "bundle exec guard init"

prepend 'Guardfile', "require 'active_support/core_ext'\n"
inject_into_file 'Guardfile', FACTORY_GIRL, after: "guard :rspec do"
run "rm public/index.html"

git :init
git add: "."
git commit: %Q{ -m 'Initial Commit From Custom Template' }
