module Refinery
  module Blocks
    class Block < Refinery::Core::BaseModel
      self.table_name = 'refinery_blocks'
      attr_accessible :title, :permatitle, :content, :position
      validates :title, :presence => true, :uniqueness => true
      validates :permatitle, :presence => true, :uniqueness => true, :format => { :with => /\S+/, :message => 'must not contain spaces' }
    end
  end
end
