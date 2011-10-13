class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :id
      t.integer :user_id
      t.integer :topic_id
      t.text :body

      t.timestamps
    end
    add_index :posts, :topic_id
    add_index :posts, :user_id
  end
  
  def self.down
    drop_table :posts
end
end
