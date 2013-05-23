require 'generator_methods'


module Londe
  class Composer
    include GeneratorMethods

    class << self

      @@features_dir = File.join(File.dirname(File.expand_path(__FILE__)), 'features')

      def features_dir; @@features_dir end


      def compose base
        @app_base = base

        builders = []

        say_status :setup, "Default features...", :blue
        shell.padding += 1
        Feature.all(:default).each do |feature|
          builders << feature.setup!
        end
        shell.padding -= 1

        say_status :setup, "Optional features...", :blue
        shell.padding += 1
        Feature.all(:optional).each do |feature|
          builders << feature.setup!
        end
        shell.padding -=1

        #run 'bundle install'

        say_status :build, "Building requested features...", :blue
        shell.padding += 1
        builders.each do |builder|
          builder.call if builder.is_a? Proc
        end
        shell.padding -= 1
      end


      def app_base
        @app_base
      end

    end
  end
end