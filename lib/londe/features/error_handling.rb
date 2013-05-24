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
      if key.present?
        say "Configuring API key..."
        quietly { generate :airbrake, "--api-key #{key}" }
        say "API key set as '#{key}'"
        say "Testing airbrake via \"rake airbrake:test\"."
        say "Please, check if you received the exception."
      else
        say "Skipping Airbrake configuration. Take a look at the TODO file for more info."
      end
    end

    instructions <<-INSTRUCTIONS
Check at http://airbrake.io if you received a test exception.
If not, you can generate the configuration once you have one:
  `rails g airbrake --api-key YOUR_API_KEY_HERE`
    INSTRUCTIONS


  end
end