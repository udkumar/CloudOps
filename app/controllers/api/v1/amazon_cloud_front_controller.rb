class Api::V1::AmazonCloudFrontController < ApplicationController
  

  def price_by_region
  	# if params[:date]
  	@cf_prices = AwsCloudFrontPrice.where("region_code > :value",  value: params[:id]).or(AwsCloudFrontPrice.where("effective_date > :filter_by_date",  filter_by_date: params[:date]))
  	if @cf_prices
  		render json: @cf_prices
  	end
  end

  def filter_price_by_region
  	render json: AwsCloudFrontPrice.find_by_effective_date(params[:date])
  end

  def sync_aws_cf_data
  	AwsServiceWorker.perform
  end

  private

  def serializer
    AwsCloudFrontPriceSerializer
  end

end
