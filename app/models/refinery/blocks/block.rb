require 'json'

module Refinery
  module Blocks
    class Block < Refinery::Core::BaseModel
      self.table_name = 'refinery_blocks'
      attr_accessible :title, :permatitle, :content, :position
      validates :title, :presence => true, :uniqueness => true
      validates :permatitle, :presence => true, :uniqueness => true, :format => { :with => /\S+/, :message => 'must not contain spaces' }

      # Some blocks contain directives to execute a method that renders the content
      def expanded_content
        if self.content.present? && self.content.start_with?('#!') && Blocks.macro_module.present?
          # Get name of method to execute
          macro = self.content.match /^#!\s*(\w+)\s*(.*)$/m
          method_name = macro[1] if macro
          method_name = method_name.to_sym if method_name
          if method_name && Blocks.macro_module.public_methods.include?(method_name)
            begin
              # Parse arguments and call method
              args = JSON.parse(macro[2], :symbolize_names => true)
              return Blocks.macro_module.send(method_name, args)
            rescue => e
              Rails::logger.error "Exception occurred during execution of #{method_name} in block: #{e}"
              return ''
            end
          end
        else
          self.content
        end
      end
    end
  end
end
