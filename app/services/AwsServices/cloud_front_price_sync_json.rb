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
					effective_date = details['effectiveDate']
					details['priceDimensions'].each do |_name, dimension|

						result << { 'source_type' => "aws", 'description' => dimension['description'], 'beginRange' => dimension['beginRange'], 'endRange' => dimension['endRange'], 'unit' => dimension['unit'], 'pricePerUnit' => dimension['pricePerUnit']['USD'], 'effectiveDate' => effective_date }
					end
				end
			end
			return result
    end

  end
end


# {
# 	"description"=>"$0.085 per GB - next 4 PB / month data transfer out", 
# 	"beginRange"=>"1048576", 
# 	"endRange"=>"5242880", 
# 	"unit"=>"GB", 
# 	"pricePerUnit"=>"0.0850000000", 
# 	"effectiveDate"=>"2019-12-01T00:00:00Z"
# }