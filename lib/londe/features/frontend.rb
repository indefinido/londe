module Londe
  class Frontend < Feature

    default

    name 'Easier and Better Frontend Development'

    details <<-DETAILS
    DETAILS


    setup do
      # TODO check for npm and ask for skipping

      gem 'haml-rails', '~> 0.4.0'
      gem 'simple_form'

      gem_group :assets do
        gem 'stylus', '~> 0.6', :require => false
      end

    end


    builder do
      # stylus
      copy_file 'templates/frontend/config/initializers/stylus.rb', "config/initializers/stylus.rb"

      # nib
      run 'npm install nib'

      # simple_form
      bootstrap = yes? "Simple Form with Twitter Bootstrap? [y/n]:"
      generate 'simple_form:install', (bootstrap ? "--bootstrap" : nil)

      # component
      copy_file 'templates/frontend/lib/tasks/component.thor', 'lib/tasks/component.thor'
      run 'thor component:create'
      run 'thor component:install'
    end


    instructions <<-INSTRUCTIONS
Stylus:
  If you have trouble making Stylus work, try forcing version 0.6.2 (or another possibly working version) in Gemfile.
  Also check the ':require => false'"

Thor:

  To manage components, run `thor help component`
    INSTRUCTIONS


  end
end