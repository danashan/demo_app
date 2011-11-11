class RenameContentToBodyInPosts < ActiveRecord::Migration
  def up
   rename_column :posts, :content, :body
  end

  def down
   rename_column :posts, :body, :content
  end
end
