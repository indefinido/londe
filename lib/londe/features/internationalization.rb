module Londe
  class Internationalization < Feature

    default

    name 'Internationalization'

    details <<-DETAILS
    DETAILS


    setup do
      #       # config.time_zone = 'Central Time (US & Canada)'
      # to:     config.time_zone = "Brasilia"
      gsub_file "config/application.rb", /(?:#\s)?(config\.time_zone\s\=\s).*$/, '\1"Brasilia"'

      #       # config.i18n.default_locale = :de
      # to:     config.i18n.default_locale = :"pt-BR"
      gsub_file "config/application.rb", /(?:#\s)?(config.i18n.default_locale = ).*$/, '\1:"pt-BR"'

      # Aproveitar e baixar dados de localização do git
      get 'https://raw.github.com/svenfuchs/rails-i18n/master/rails/locale/pt-BR.yml', 'config/locales/pt-BR.yml'
    end


    builder do
    end

    instructions do
      <<-INSTRUCTIONS
      INSTRUCTIONS
    end


  end
end



