module Refinery
  module Blocks
    class BlocksController < ::ApplicationController

      before_filter :find_all_blocks
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @block in the line below:
        present(@page)
      end

      def show
        @block = Block.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @block in the line below:
        present(@page)
      end

    protected

      def find_all_blocks
        @blocks = Block.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/blocks").first
      end

    end
  end
end
