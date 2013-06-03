module Londe
  class Deployment < Feature

    default

    name 'Deployment'

    details <<-DETAILS
    DETAILS


    setup do
      gem_group :development do
        gem 'capistrano', '< 2.13.5' # greater version come with a strange bug oO
        gem 'capistrano_colors'
      end

      gem_group :production do
        gem 'therubyracer'
        gem 'unicorn'
      end

      # TODO add deployment recipes

      # TODO create staging environment
      #   copy production.rb to staging.rb environment

      # TODO test this
      template 'templates/deployment/config/unicorn.rb.erb', 'config/unicorn.rb'
    end


    builder do
    end

    instructions <<-INSTRUCTIONS
Unicorn:
  Created default config within config/unicorn.rb
  ATTENTION:
   - You may need to change the APP_PATH depending on your deployment path.
   - If you are using ActiveRecord, uncomment the lines inside the config/unicorn.rb, inside the before_fork and after_fork hooks that do connection stuff.

    INSTRUCTIONS


  end
end