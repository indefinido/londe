require 'sinatra/base'
require 'stylus'
require 'stylus/tilt'


class Modules < Sinatra::Base
  get '/' do
    @colors = %W{
      #96526B
      #D17869
      #EBAD60
      #F5CF66
      #8BAB8D
    }
    haml :index
  end
end