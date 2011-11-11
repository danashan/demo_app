class RenameConversations < ActiveRecord::Migration
  def self.up
    rename_table :conversations, :topics
  end

  def self.down
    rename_table :conversations, :topics
  end
end
