require 'carrierwave/orm/activerecord'
require_relative "../uploader/image_uploader"
class User < ActiveRecord::Base
  has_and_belongs_to_many :tracks
  has_and_belongs_to_many :playlists

  include BCrypt 
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password 

  mount_uploader :image, ImageUploader
  
end