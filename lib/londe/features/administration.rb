module Londe
  class Administration < Feature

    optional

    name 'Administration Management'

    details <<-DETAILS
    DETAILS


    setup do
      gem 'activeadmin-mongoid', '0.0.2.jpmckinney.0'
    end


    builder do                 
      generate 'active_admin:install'
    end

    instructions do
      <<-INSTRUCTIONS
- Take a look at the documentation at https://github.com/elia/activeadmin-mongoid
IMPORTANT: check if there is a new version of the activeadmin-mongoid gem! The current one is very unreliable.
      INSTRUCTIONS
    end


  end
end