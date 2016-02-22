require 'carrierwave/orm/activerecord'
require_relative "../uploader/image_uploader"
class Playlist < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tracks
  mount_uploader :image, ImageUploader
end   