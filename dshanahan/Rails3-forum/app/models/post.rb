# == Schema Information
#
# Table name: posts
#
#  id         :integer         not null, primary key
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#  topic_id   :integer
#  user_id    :integer
#

class Post < ActiveRecord::Base
  belongs_to :topic
 
  belongs_to :user

  validates :body, :presence => true

 # default_scope :order => 'created_at DESC'
end
