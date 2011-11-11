class RenameConversationIDtoTopicIdInPosts < ActiveRecord::Migration
  def up
    rename_column :posts, :conversation_id, :topic_id
  end

  def down
    rename_column :posts, :topic_id, :conversation_id
  end
end
