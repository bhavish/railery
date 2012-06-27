CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAIQ2235B3E7UMNR7A',       # required
    :aws_secret_access_key  => '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'
  }
  config.fog_directory  = 'lifevideobucket'                     # required
end