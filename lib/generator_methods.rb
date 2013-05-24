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

      # def run *args
      #   quietly { super *args }
      # end

    end


  end
end