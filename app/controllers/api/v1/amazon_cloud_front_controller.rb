class Api::V1::AmazonCloudFrontController < ApplicationController
  

  def region
  	@aws = AwsCloudFrontPrice.all
  	# AwsCloudFrontPriceSerializer.new(@aws).as_json
  end

  def sync_aws_cf_data
  	AwsServiceWorker.perform
  end

end
