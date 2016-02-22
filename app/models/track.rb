require 'carrierwave/orm/activerecord'
require_relative "../uploader/track_uploader"
require_relative "../uploader/image_uploader"
class Track < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :playlists
  mount_uploader :file, TrackUploader
  mount_uploader :image, ImageUploader
end   