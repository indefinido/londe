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

      # create staging environment
      # copy production.rb to staging.rb environment
    end


    builder do
    end

    instructions <<-INSTRUCTIONS
TODO: dar instruções do que mais fazer!
    INSTRUCTIONS


  end
end