module AwsServices
  class CloudFrontPriceSyncJson 
    attr_accessor :errors
    require 'httparty'

    BASE = 'https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonCloudFront/current/index.json'.freeze

    def initialize(_args = {})
      @api_endpoint = BASE
    end

    def get_cf_price
      response = get_api_response
      price_data_save(response)
    end

    def get_api_response
      response = HTTParty.get(@api_endpoint, query: {}, headers: {})
      parsed = JSON.parse(response.body)
      parsed
    rescue StandardError => e
      puts "failed #{e}"
    end

    private

    def price_data_save(cf_data)
      cf_data['terms']['OnDemand'].each do |_product_key, offers|
        offers.each do |_offer, details|
          @price = AwsCloudFrontPrice.new

          effective_date = details['effectiveDate']

          sku_number = details['sku']
          region_name = cf_data['products'][sku_number]['attributes']['location']

          # Added region code manually because code is not available in given APIs
          region_hash = AwsCloudFrontPrice.aws_region_mapping("aws")
          region_code = region_hash[region_name]

          # Sync only unique data
          check_date = AwsCloudFrontPrice.find_by_effective_date(effective_date)
          # next if check_date
          AwsCloudFrontPrice.select(:effective_date).group(:effective_date).having("effective_date == #{effective_date}")
          details['priceDimensions'].each do |_name, dimension|
            @price.description = dimension['description'] || ''
            @price.begin_range = dimension['beginRange'] || ''
            @price.end_range   = dimension['endRange'] || ''
            @price.unit        = dimension['unit'] || ''
            @price.price_per_unit = dimension['pricePerUnit']['USD'] || ''
            @price.effective_date = effective_date || ''
            @price.region_name = region_name || ''
            @price.region_code = region_code || ''
          end
          @price.save
        end
      end
    end

  end
end
