require 'httparty'
class ApiTest
	def self.required_data
		url ="https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonCloudFront/current/index.json"
		response = HTTParty.get(url, :query => {},:headers => {})
		parsed = JSON.parse(response.body)
		
		result = []
		parsed['terms']['OnDemand'].each do |_product_key, offers|
			offers.each do |_offer, details|
				effective_date = details['effectiveDate']
				details['priceDimensions'].each do |_name, dimension|
					result << { 'description' => dimension['description'], 'beginRange' => dimension['beginRange'], 'endRange' => dimension['endRange'], 'unit' => dimension['unit'], 'pricePerUnit' => dimension['pricePerUnit']['USD'], 'effectiveDate' => effective_date }
				end
			end
		end
		result
	end
end

puts ApiTest.required_data
