class User < ActiveRecord::Base
  has_many :posts
  has_many :forums
  has_many :topics
  
  validates_presence_of :name
  
  default_scope :order => :name
  
  def to_s
    name
  end
end
