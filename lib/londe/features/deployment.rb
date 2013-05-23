module Londe
  class Deployment < Feature

    default

    name 'Deployment'

    details <<-DETAILS
    DETAILS


    setup do
      gem 'capistrano'
      gem 'capistrano_colors'

      # TODO add deployment recipe
    end


    builder do
    end

    instructions <<-INSTRUCTIONS
TODO: dar instruções do que mais fazer!
    INSTRUCTIONS


  end
end