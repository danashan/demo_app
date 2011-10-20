class User < ActiveRecord::Base
  attr_accessible :name
  has_many :posts
  has_many :topics
end
