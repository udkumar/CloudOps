require 'rails_helper'

RSpec.describe AwsCloudFrontPrice, type: :model do


  describe AwsCloudFrontPrice, '#filter_by_region_date' do
    it 'returns price for specific region' do
    	cf_prices = AwsCloudFrontPrice.where('region_code=?', "us-east-1")
    	cf_prices.count.should be >= 1
    end
    
    it 'returns price for specific region and date' do
     	cf_prices = AwsCloudFrontPrice.where('region_code=? AND effective_date=?', "us-east-1", "2019-12-01")
     	cf_prices.count.should be >= 1
    end

    it 'returns data not avalable' do
     	cf_prices = AwsCloudFrontPrice.where('region_code=? AND effective_date=?', "us-east-1", "2019-12-01")
     	cf_prices.count.should eq(0)
    end

  end
end
