module Londe
  class FileUpload < Feature

    optional

    name 'File Upload'

    details <<-DETAILS
    DETAILS


    setup do
      gem "carrierwave"
      gem "carrierwave-mongoid", require: "carrierwave/mongoid"
      gem "rmagick"
    end


    builder do

    end

    instructions do
      <<-INSTRUCTIONS
Take a look at the documentation at https://github.com/carrierwaveuploader/carrierwave-mongoid
      INSTRUCTIONS
    end


  end
end