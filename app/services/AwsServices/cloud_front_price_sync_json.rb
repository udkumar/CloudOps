module AwsServices	
  class CloudFrontPriceSyncJson
    attr_accessor :errors
    require 'httparty'

    BASE = "https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonCloudFront/current/index.json"

    def initialize(args = {})
    	@api_endpoint = BASE
    end

    def get_cf_price
    	response = get_api_response
    	price_data_save(response)
    end

    def get_api_response
    	begin
				response = HTTParty.get(@api_endpoint, :query => {},:headers => {})
				parsed = JSON.parse(response.body)
				return parsed
    	rescue => e
    		puts "failed #{e}"
    	end
    end

    private
    
    def price_data_save(cf_data)
    	result = []
      
	    cf_data['terms']['OnDemand'].each do |_product_key, offers|
				offers.each do |_offer, details|
          @price = AwsCloudFrontPrice.new
					
          effective_date = details['effectiveDate']
          sku_number = details['sku']
          product_region = cf_data['products'][sku_number]['attributes']["location"]
					
          details['priceDimensions'].each do |_name, dimension| 
            @price.description = dimension['description']
            @price.begin_range = dimension['beginRange']
            @price.end_range   = dimension['endRange']
            @price.unit        = dimension['unit']
            @price.price_per_unit = dimension['pricePerUnit']['USD']
            @price.effective_date = effective_date
            @price.region_name = product_region
					end
          @price.save
				end
        
			end
    end

  end
end
