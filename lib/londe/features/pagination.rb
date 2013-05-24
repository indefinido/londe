module Londe
  class Pagination < Feature

    optional

    name 'Pagination'

    details <<-DETAILS
    DETAILS


    setup do
      gem 'kaminari', '~> 0.14'
    end


    builder do
      generate 'kaminari:config'
    end

    instructions do
      <<-INSTRUCTIONS
- To use pagination, simply do like: `User.page(7).per(50)`
- A config file was generated so you can change some default values.
- Take a look at the documentation at https://github.com/amatsuda/kaminari
      INSTRUCTIONS
    end


  end
end