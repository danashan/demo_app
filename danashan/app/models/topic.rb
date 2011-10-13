class Topic < ActiveRecord::Base
  has_many :posts, :dependent => :destroy

  belongs_to :user
  belongs_to :forum
  validates_presence_of :title
  validates_length_of :title, :maximum=>50
end

def to_s
  title
end