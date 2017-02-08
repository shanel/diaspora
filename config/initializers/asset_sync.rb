if defined? AssetSync
  AssetSync.configure do |config|
    config.enabled = true
    
    if AppConfig.environment.s3.enable?
      config.fog_provider = 'AWS'
      config.aws_access_key_id = AppConfig.environment.s3.key.get
      config.aws_secret_access_key = AppConfig.environment.s3.secret.get
      config.fog_directory = AppConfig.environment.s3.bucket.get
  
      # Increase upload performance by configuring your region
      config.fog_region = AppConfig.environment.s3.region.get
    end

    if AppConfig.environment.gcloud.enable?
      config.fog_provider = 'Google'
      config.google_storage_access_key_id = AppConfig.environment.gcloud.key.get
      config.google_storage_secret_access_key = AppConfig.environment.gcloud.secret.get
      config.fog_directory = AppConfig.environment.gcloud.bucket.get
  
      # Increase upload performance by configuring your region
      config.fog_region = AppConfig.environment.gcloud.region.get
    end
    #
    # Don't delete files from the store
    # config.existing_remote_files = "keep"
    #
    # Automatically replace files with their equivalent gzip compressed version
    # config.gzip_compression = true
    #
    # Use the Rails generated 'manifest.yml' file to produce the list of files to 
    # upload instead of searching the assets directory.
    # config.manifest = true
    #
    # Fail silently.  Useful for environments such as Heroku
    # config.fail_silently = true
  end
end
