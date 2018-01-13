require 'carrierwave/storage/fog'
CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    :provider               => '',
    :aws_access_key_id      => "",
    :aws_secret_access_key  => "",
    :region                 => 'us-west-1'
    }

  config.fog_directory  = "microbus-api"
end
