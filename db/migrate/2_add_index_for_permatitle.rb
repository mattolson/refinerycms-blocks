class AddIndexForPermatitle < ActiveRecord::Migration

  def up
    add_index :refinery_blocks, :permatitle
  end

  def down
    remove_index :refinery_blocks, :permatitle
  end

end
