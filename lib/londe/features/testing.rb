module Londe
  class Testing < Feature

    default

    name 'Testing'

    details <<-DETAILS
    DETAILS




    setup do
      gem_group :development do
        gem 'guard-rspec'       , '~> 3.0'
        gem 'guard-livereload'  , '~> 1.4'
        gem 'guard-konacha'     , '~> 0.3'
        gem 'guard-bundler'     , '~> 1.0'
        gem 'guard-pow'         , '~> 1.0'
      end

      gem_group :test do
        gem 'shoulda-matchers'  , '~> 2.1'
        gem 'forgery'           , '~> 0.5'
      end

      gem_group :test, :development do
        gem 'cpf_faker'         , '~> 1.3'
        gem 'rspec-rails'       , '~> 2.13'
        gem 'mongoid-rspec'     , '~> 1.8'
        gem 'capybara'          , '~> 2.1'
        gem 'launchy'           , '~> 2.3'
        gem 'database_cleaner'  , '~> 1.0'
        gem 'fabrication'       , '~> 2.7'
        gem 'konacha'           , '~> 2.7'
        gem 'selenium-webdriver', '~> 2.32'
        gem 'growl'             , '~> 1.0'
        gem 'rb-fsevent'        , require: false
      end
    end




    builder do
      generate 'rspec:install'

      require_in_spec_helper 'capybara/rspec'
      require_in_spec_helper 'rails/mongoid'
      require_in_spec_helper 'forgery'
      require_in_spec_helper 'database_cleaner'

      run 'guard init'

      # gem 'rspec-rails'
      copy_file 'templates/testing/.rspec', '.rspec'

      # gem 'rspec-mongoid'
      copy_file 'templates/testing/spec/support/mongoid.rb', 'spec/support/mongoid.rb'

      # gem 'fabrication'
      insert_into_file 'config/application.rb', after: "class Application < Rails::Application\n" do
        <<-CONFIG

    config.generators do |g|
      g.test_framework      :rspec, fixture: true
      g.fixture_replacement :fabrication
    end

        CONFIG
      end


      # gem 'database_cleaner'
      insert_into_file 'spec/spec_helper.rb', after: "RSpec.configure do |config|\n" do
        <<-CONFIG

  config.before(:each) do
    DatabaseCleaner.orm = "mongoid"
    DatabaseCleaner.strategy = :truncation, {except: %w[ neighborhoods ]}
    DatabaseCleaner.clean
  end

        CONFIG
      end

    end




    instructions <<-INSTRUCTIONS
Capybara:
  IMPORTANT! Some of the defaults have changed in Capybara 2.1. If you're experiencing failures,
  please revert to the old behaviour by setting:

    Capybara.configure do |config|
      config.match = :one
      config.exact_options = true
      config.ignore_hidden_elements = true
      config.visible_text_only = true
    end

Guard:
  Run `guard` command in terminal to get started.
  Documentation: https://github.com/guard/guard

Growl
  Growl uses a command line tool growlnotify that must be separately downloaded and installed.
  http://growl.info/downloads
    INSTRUCTIONS




    class << self
      protected

      def require_in_spec_helper file
        insert_into_file 'spec/spec_helper.rb', after: "require 'rspec/autorun'\n" do
          "require '#{file}'\n"
        end
      end

    end

  end
end