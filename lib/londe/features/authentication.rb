module Londe
  class Authentication < Feature

    optional

    name 'Authentication'

    details <<-DETAILS
    DETAILS


    setup do
      gem 'devise', '~> 2.2'
    end


    builder do
      silence_stream(STDOUT) do
        generate 'devise:install'
        @bosta = 1
      end
    end

    instructions do
      <<-INSTRUCTIONS
- Take a look at the generated devise configuration.
- Add Devise to a model using `rails generate devise MODEL`
- Take a look at the documentation at https://github.com/plataformatec/devise
#{@bosta}
      INSTRUCTIONS
    end


  end
end