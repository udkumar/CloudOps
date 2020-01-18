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
          region_name = cf_data['products'][sku_number]['attributes']["location"]

          # Added region code manually because code is not available in given APIs
          region_hash = {"EU (Paris)" => "eu-west-3", "US West (Oregon)" => "us-west-2", "EU (London)" => "eu-west-2", "South America (Sao Paulo)" => "sa-east-1", "EU (Frankfurt)" => "eu-central-1", "Asia Pacific (Hong Kong)" => "ap-east-1", "Asia Pacific (Seoul)" => "ap-northeast-2", "Asia Pacific (Mumbai)" => "ap-south-1", "EU (Ireland)" => "eu-west-1", "US East (N. Virginia)" => "us-east-1", "US West (N. California)" => "us-west-1", "Asia Pacific (Singapore)" => "ap-southeast-1", "Asia Pacific (Sydney)" => "ap-southeast-2", "EU (London)" => "eu-west-2", "US East (Ohio)" => "eu-east-2", "EU (Stockholm)" => "eu-north-1", "Middle East (Bahrain)" => "me-south-1", "Canada (Central)" => "ca-central-1", "Asia Pacific (Tokyo)" => "ap-northeast-1"}
          region_code = region_hash[region_name]

          # Sync only unique data
					check_date = AwsCloudFrontPrice.find_by_effective_date(effective_date)
          if !check_date
            details['priceDimensions'].each do |_name, dimension| 
              @price.description = dimension['description']
              @price.begin_range = dimension['beginRange']
              @price.end_range   = dimension['endRange']
              @price.unit        = dimension['unit']
              @price.price_per_unit = dimension['pricePerUnit']['USD']
              @price.effective_date = effective_date
              @price.region_name = region_name
              @price.region_code = region_code || ""
  					end
            @price.save
          end
				end
        
			end
    end

  end
end
