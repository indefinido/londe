module Londe
  class Deployment < Feature

    default

    name 'Deployment'

    details <<-DETAILS
    DETAILS


    setup do
      gem_group :development do
        gem 'capistrano'
        gem 'capistrano_colors'
      end

      # TODO add deployment recipes

      # TODO create staging environment
      #   copy production.rb to staging.rb environment

      # TODO test this
      template 'templates/deployment/config/unicorn.rb', 'config/unicorn.rb'
    end


    builder do
    end

    instructions <<-INSTRUCTIONS
Unicorn:
  Created default config within config/unicorn.rb
  You may need to change the APP_PATH depending on your deployment path.
    INSTRUCTIONS


  end
end