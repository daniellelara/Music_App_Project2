class TrackUploader < CarrierWave::Uploader::Base
    storage :file 
 def store_dir
   #create folder call uploads
   "#{APP_ROOT}/public/uploads/"
   end 
 
end
