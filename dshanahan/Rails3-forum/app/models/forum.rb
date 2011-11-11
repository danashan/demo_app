class Forum < ActiveRecord::Base
  has_many :topics, :dependent => :destroy
  belongs_to :user
  
 
  validates :title, :presence => true
  validates :description, :presence => true

end

def to_s
  title
end