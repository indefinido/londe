require 'generator_methods'


module Londe
  class Feature
    include GeneratorMethods

    class << self


      def all type = nil
        features = @features || load_features
        return @features if type == nil
        @features[type]
      end


      def load_features
        @features = { default: [], optional: [] }

        Dir["#{Composer.features_dir}/*"].each do |filename|
          require filename
          feature = "Londe::#{filename.split('/').last.gsub('.rb','').camelize}".constantize
          raise "Feature #{feature} needs a type!" if feature.type.nil?
          @features[feature.type] << feature
        end

        @features
      end




      module Setup

        # set up the feature and returns its builder if not skipped
        def setup!
          if default? || want_to_install?
            say_name
            detail if default?
            shell.padding += 1
            setup
            shell.padding -= 1
            done
          else
            skip
            skipped
          end
          builder unless skip?
        end

        def build!
          @builder.call
          done
        end


        # define the feature builder
        def builder &block
          if block_given?
            @builder = Proc.new do
              say_name
              block.call
              shell.padding += 1
              save_instructions if instructions.present?
              shell.padding -= 1
            end
          else
            @builder
          end
        end

        # define or call setup block
        def setup &block
          if block_given?
            @setup = block
          else
            @setup.call
          end
        end

        # set or return feature name
        def name str = nil
          return @name if str.nil?
          @name = str
        end

        # set or return feature details
        def details str = nil
          return @details if str.nil?
          @details = str
        end

        # set the instructions with given block return
        # or return the stored instructions
        def instructions str = nil, &block
          return @instructions if str.nil? && !block_given?
          @instructions = str || block.call
        end
        # skip the feature building
        def skip
          @skip = true
        end

        # check for feature skip
        def skip?
          !!@skip
        end


        # set the feature as default
        def default
          @type = :default
        end

        # set the feature as optional
        def optional
          @type = :optional
        end

        def default?
          @type == :default
        end

        # get feature type
        def type
          @type
        end

      end



      module Helpers

        def say_name
          say_status :feature, set_color(name,:blue), :blue
        end

        # save instructions to TODO file
        def save_instructions
          file = 'TODO'
          text = "### TO-DO for #{name.upcase} feature:\n\n#{instructions}\n\n\n"

          in_root do
            create_file file unless File.exists? file
            append_to_file file, text
          end
        end

        # ask for installation and print details
        def want_to_install?
          say "Want to install #{name} feature?"
          detail
          yes? "[y/n]"
        end

        def detail
          return if details.blank?
          shell.padding += 1
          details.split(/\n/).each do |line|
            say line
          end
          shell.padding -= 1
        end

        def done
          say_status :done, "", :green
        end

        def skipped
          say_status :skipped, "", :red
        end

      end


      include Setup
      include Helpers


    end
  end
end