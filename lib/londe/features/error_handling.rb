module Londe
  class ErrorHandling < Feature

    default

    name 'Error Handling'

    details <<-DETAILS
    DETAILS


    setup do
      gem 'airbrake'
      gem_group :development do
        gem 'better_errors'
        gem 'binding_of_caller'
        gem 'pry'
        gem 'pry-rescue'
      end
    end


    builder do
      key = ask "Enter your Airbrake API key:"
      say "Configuring API key..."
      generate :airbrake, "--api-key #{key}"
      say "API key set as '#{key}'"
      say "Testing airbrake via \"rake airbrake:test\"."
      say "Please, check if you received the exception."
    end

    instructions <<-INSTRUCTIONS
      Check at http://airbrake.io if you received the exception.
    INSTRUCTIONS


  end
end