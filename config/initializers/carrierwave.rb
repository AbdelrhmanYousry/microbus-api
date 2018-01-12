require 'carrierwave/storage/fog'
CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => "AKIAI4SCD6OIT5YPOEDA",
    :aws_secret_access_key  => "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",
    :region                 => 'us-west-1'
    }

  config.fog_directory  = "microbus-api"
end
