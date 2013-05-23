module Londe
  module GeneratorMethods

    def self.included base
      base.extend ClassMethods
    end


    module ClassMethods

      # TODO implement respond_to_missing?
      def method_missing *args, &block
        if block_given?
          Composer.app_base.send *args, &block
        else
          Composer.app_base.send *args
        end
      end

      def gem *args
        Composer.app_base.gem *args
      end

      def run *args
        quietly { super *args }
      end

      # Change the current destination to the destination provided, temporalely
      def to destination
        current_destination = destination_root

        say_status :to, destination
        shell.padding += 1

        self.destination_root = "#{destination_root}/#{destination}"
        yield
        self.destination_root = current_destination
        shell.padding -= 1
      end

    end


  end
end