module Londe
  class Database < Feature

    default

    name 'Database'

    details <<-DETAILS
    DETAILS


    setup do

      # add gem
      gem 'mongoid', '~> 3.0'

      # comment out all active record mentions
      inside 'config' do
        files = ['application.rb'] + Dir['environments/*']
        files.each { |file| comment_lines file, /active_record/ }
      end

      # swich require of rails/all
      inside 'config' do
        file = 'application.rb'
        data = /rails\/all.*$/
        insert_into_file file, after: data do
          <<-REQUIRES

require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "rails/test_unit/railtie"
require "sprockets/railtie"
          REQUIRES
        end
        comment_lines file, data
      end

      template 'templates/database/config/mongoid.yml', 'config/mongoid.yml'
    end


    builder do
    end

    instructions <<-INSTRUCTIONS
    INSTRUCTIONS


  end
end