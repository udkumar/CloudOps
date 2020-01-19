class AwsServiceWorker 
  include Sidekiq::Worker
  # include Sidekiq::Status::Worker
  sidekiq_options retry: false

  def perform_in(*_args)
    cf_price_sync
  end

  private

  def cf_price_sync
    AwsServices::CloudFrontPriceSyncJson.new.get_cf_price
  end
end
