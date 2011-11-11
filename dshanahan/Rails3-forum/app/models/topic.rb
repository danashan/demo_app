class Topic < ActiveRecord::Base
  belongs_to :forum
  has_many :posts, :dependent => :destroy
#  belongs_to :user

  validates :title, :presence => true
  validates :description, :presence => true

end
def to_s
  title
end