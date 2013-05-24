require 'generator_methods'


module Londe
  class Composer
    include GeneratorMethods

    class << self

      @@features_dir = File.join(File.dirname(File.expand_path(__FILE__)), 'features')

      def features_dir; @@features_dir end


      def compose base
        @app_base = base

        source_paths << File.dirname(File.expand_path(__FILE__))

        builders = []

        say_step :setup, "Default features..."
        shell.padding += 1
        Feature.all(:default).each do |feature|
          builders << feature.setup!
        end
        shell.padding -= 1

        say_step :setup, "Optional features..."
        shell.padding += 1
        Feature.all(:optional).each do |feature|
          builders << feature.setup!
        end
        shell.padding -=1

        #run 'bundle install'

        say_step :build, "Building requested features..."
        shell.padding += 1
        builders.each do |builder|
          builder.call if builder.is_a? Proc
        end
        shell.padding -= 1
      end


      def app_base
        @app_base
      end

      protected

      def say_step type, text
        say_status type, set_color(text,:magenta), :magenta
      end

    end
  end
end