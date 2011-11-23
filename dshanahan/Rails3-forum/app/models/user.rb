# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  first_name         :string(255)
#  last_name          :string(255)
#  username           :string(255)
#  email              :string(255)
#  active             :boolean
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#

require 'digest'
class User < ActiveRecord::Base
 
  attr_accessor :password
  
  attr_accessible :username, :email, :first_name, :last_name, :password, :password_confirmation, :username, :active
  

  has_many :posts
  
  validates :password, :presence => true,
            :confirmation => true,
            :length => { :within => 6..40 }
 #   validates_presence_of :password, :on => :create
    validates_presence_of :first_name, :last_name
    validates_uniqueness_of :username, :email

   before_save :encrypt_password 
  
def active?
   active
 end
     
 def has_password?(submitted_password)
     encrypted_password == encrypt(submitted_password)        
end

def self.authenticate(email, submitted_password)
  user = find_by_email(email)
  return nil if user.nil?
  return user if user.has_password?(submitted_password)
end

def self.authenticate_with_salt(id, cookie_salt)
  user = find_by_id(id)
  (user && user.salt == cookie_salt) ? user :nil
end

private

def encrypt_password
  self.salt = make_salt unless has_password?(password)
  self.encrypted_password = encrypt(self.password)
end

def encrypt(string)
  secure_hash("#{salt}--#{string}")
end
def make_salt
  secure_hash("#{Time.now.utc}--#{password}")
end
def secure_hash(string)
  Digest::SHA2.hexdigest(string)
end
end









































