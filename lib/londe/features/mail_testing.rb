module Londe
  class MailTesting < Feature

    optional

    name 'Mail Testing'

    details <<-DETAILS
    DETAILS




    setup do
      gem_group :test do
        gem 'email_spec'
        gem 'capybara-email'
      end
    end




    builder do
      require_in_spec_helper 'email_spec'
      require_in_spec_helper 'capybara/email/rspec'

      # gem 'email_spec'
      insert_into_file 'spec/spec_helper.rb', after: "RSpec.configure do |config|\n" do
        <<-CONFIG

  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)

        CONFIG
      end

    end




    instructions <<-INSTRUCTIONS
Email Spec:
  Documentation: https://github.com/bmabey/email-spec

Capybara Email:
  Documentation: https://github.com/dockyard/capybara-email
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