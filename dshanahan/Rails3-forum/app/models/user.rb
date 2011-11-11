class User < ActiveRecord::Base
  attr_accessible :username, :email, :first_name, :last_name, :active
  
  has_many :posts
  has_many :topics
  has_many :forums

  
#  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  validates :username, :presence => true,
              :length => {:maximum => 20}
              
  validates :email, :presence => true,
            #:format => { :with => email_regex} ,
             :uniqueness => { :case_sensitive => false }
  
end
