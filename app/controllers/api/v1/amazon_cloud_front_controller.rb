class Api::V1::AmazonCloudFrontController < ApplicationController
  def price_by_region
    @cf_prices = AwsCloudFrontPrice.filter_by_region_date(params[:id], params[:date])
    json_response(@cf_prices, '200')
  end

  private

  def serializer
    AwsCloudFrontPriceSerializer
  end
end
