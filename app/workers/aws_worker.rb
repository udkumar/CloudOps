class AwsWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker


  def perform(action, args = nil)
   send(action, args)
 	end

 	private

 	def cf_price_sync
 		AwsServices::CloudFrontPriceSyncJson.new().get_cf_price
 	end
end