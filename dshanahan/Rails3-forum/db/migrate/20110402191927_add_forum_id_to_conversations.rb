class AddForumIdToTopics < ActiveRecord::Migration
  def self.up
    add_column :topics, :forum_id, :integer
    
  end

  def self.down
    remove_column :topics, :forum_id
  end
  
  def rename_table (conversations, topics)
  end
end
