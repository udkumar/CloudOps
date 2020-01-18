class Api::V1::AmazonCloudFrontController < ApplicationController
  

  def region
  	
  end

  def sync_aws_cf_data
  	AwsServiceWorker.perform
  end

end
