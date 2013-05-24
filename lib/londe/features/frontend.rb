module Londe
  class Frontend < Feature

    default

    name 'Easier and Better Frontend Development'

    details <<-DETAILS
    DETAILS


    setup do
      # TODO check for npm and ask for skipping

      gem 'haml-rails', '~> 0.4.0'

      gem_group :assets do
        gem 'stylus', '~> 0.6', :require => false
      end

      # TODO adicionar normalize.css
    end


    builder do
      run 'npm install nib'

      file "config/initializers/stylus.rb", <<-INITIALIZER
require 'stylus'
Stylus.use :nib
      INITIALIZER
    end


    instructions <<-INSTRUCTIONS
If you have trouble making Stylus work, try forcing version 0.6.2 (or another possibly working version) in Gemfile.
Also check the ':require => false'"
    INSTRUCTIONS


  end
end