CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
        :provider              => 'AWS',
        :aws_access_key_id     => ENV['S3_KEY'],
        :aws_secret_access_key => ENV['S3_SECRET'],
        :region => 'us-west-2'
    }

    config.fog_directory = ENV['S3_BUCKET']
    config.fog_public    = true
  else Rails.env.development?
    config.storage = :file
    config.root = File.join(APP_ROOT ,"public")
    config.store_dir = File.join("uploads")
  end
end