class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :id
      t.string :title, :limit => 50
      t.integer :forum_id
      t.integer :user_id

      t.timestamps
    end
    add_index :topics, :forum_id
    add_index :topics, :user_id
  end
  
  def self.down
    drop_table :topics
end
end
