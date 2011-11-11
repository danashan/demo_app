class AddUSerIdToForums < ActiveRecord::Migration
  def self.up
    add_column :forums, :user_id, :integer
  end

  def self.down
    remove_column :forums, :user_id
  end
end
