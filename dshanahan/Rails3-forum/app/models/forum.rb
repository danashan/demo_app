# == Schema Information
#
# Table name: forums
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer
#

class Forum < ActiveRecord::Base
  has_many :topics, :dependent => :destroy
  belongs_to :user
  
 
  validates :title, :presence => true
  validates :description, :presence => true

  def user?
      self.user
    end
    
end

def to_s
  title
end
