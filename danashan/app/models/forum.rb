class Forum < ActiveRecord::Base
  belongs_to :user

  has_many :topics, :dependent => :destroy
#  validates_presence_of :title
end
