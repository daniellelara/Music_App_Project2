class ImageUploader < CarrierWave::Uploader::Base
  def store_dir
    #create folder call uploads
    "#{APP_ROOT}/public/uploads/images" if Sinatra::Application.settings.development?
  end
end
