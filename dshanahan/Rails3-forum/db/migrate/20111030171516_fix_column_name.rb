class FixColumnName < ActiveRecord::Migration
  def self.up
   rename_column :posts, :conversation_id, :post_id
 end
  def self.down
    rename_column :posts, :post_id, :conversation_id
  end
end

