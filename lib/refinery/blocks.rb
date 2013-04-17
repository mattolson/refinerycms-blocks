require 'refinerycms-core'

module Refinery
  autoload :BlocksGenerator, 'generators/refinery/blocks_generator'

  module Blocks
    require 'refinery/blocks/engine'
    require 'refinery/blocks/configuration'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
