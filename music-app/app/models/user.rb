class User < ActiveRecord::Base
  has_and_belongs_to_many :tracks
  include BCrypt 
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password  
end