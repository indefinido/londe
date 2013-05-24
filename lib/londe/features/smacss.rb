module Londe
  class Smacss < Feature

    default

    name 'SMACSS'

    details <<-DETAILS
    DETAILS


    setup do
      directory 'templates/smacss', 'app'
      remove_file 'app/assets/stylesheets/application.css'

      # TODO add modules page to public directory
    end


    builder do
    end

    instructions <<-INSTRUCTIONS
The file app/assets/stylesheets/application.css was removed.
Use app/assets/stylesheets/application/index.styl instead.
    INSTRUCTIONS


  end
end