module Londe
  class DevelopmentFacility < Feature

    default

    name 'Development Facilities'

    details <<-DETAILS
    DETAILS


    setup do
      gem 'powify'

      gem_group :development do
        gem 'letter_opener'
      end

      gem_group :development, :test do
        gem 'awesome_print'
      end
    end


    builder do
      name = ask "Give a name to your pow app (default to '#{app_name}'): "
      run "powify create #{name}"
    end

    instructions do
      <<-INSTRUCTIONS
Powify:
  Type `powify browse app_name` to open the application in your browser.

Awesome Print:
  Use like ap(object) to awesomely print anything.
      INSTRUCTIONS
    end


  end
end