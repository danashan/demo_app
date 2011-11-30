# == Schema Information
#
# Table name: topics
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  forum_id    :integer
#  user_id     :integer
#

class Topic < ActiveRecord::Base
  belongs_to :forum
  has_many :posts, :dependent => :destroy
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
