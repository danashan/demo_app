class Post < ActiveRecord::Base
  
  belongs_to :topic
  
  belongs_to :user
  
  validates_presence_of :body, :topic

#created_by_user, :class_name => "User"

end
