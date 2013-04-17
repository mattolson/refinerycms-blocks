module Refinery
  module Blocks
    include ActiveSupport::Configurable

    # Module to look in for macro support
    config_accessor :macro_module
    self.macro_module = nil

    class << self
      def configure!
        # Make sure macro module actually exists
        begin
          Blocks.macro_module = Blocks.macro_module.constantize
          Blocks.macro_module = nil unless Blocks.macro_module.try(:class) == Module
        rescue NameError
          Rails::logger.error "Refinery::Blocks.macro_module not found."
          Blocks.macro_module = nil
        end
      end
    end
  end
end
