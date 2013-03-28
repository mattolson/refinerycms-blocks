module Refinery
  module Blocks
    module Admin
      class BlocksController < ::Refinery::AdminController

        crudify :'refinery/blocks/block',
                :xhr_paging => true

      end
    end
  end
end
