module Londe
  class Smacss < Feature

    default

    name 'SMACSS'

    details <<-DETAILS
Create stylesheets structure in SMACSS way and add a sinatra app for the modules page.
    DETAILS


    setup do
      # stylesheets structure
      directory 'templates/smacss/app', 'app'
      remove_file 'app/assets/stylesheets/application.css'

      # TODO make sure it's working fine
      directory 'templates/smacss/lib', 'lib'
      gem_group :development do
        gem 'sinatra'
      end

      route <<-ROUTE
# sinatra app for modules page
  if Rails.env.development?
    require 'modules/modules'
    mount Modules => "/modules"
  end
      ROUTE
    end


    builder do
    end

    instructions <<-INSTRUCTIONS
The file app/assets/stylesheets/application.css was removed.
Use app/assets/stylesheets/application/index.styl instead.

Acess the modules page at /modules.
    INSTRUCTIONS


  end
end