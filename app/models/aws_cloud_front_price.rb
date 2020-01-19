class AwsCloudFrontPrice < ApplicationRecord
  before_save :service_source_default_name

  # Provide data to API call
  def self.filter_by_region_date(*args)
    cf_prices = ''
    if args[1]
      cf_prices = AwsCloudFrontPrice.where('region_code=? AND effective_date=?', args[0], args[1])
    else
      cf_prices = AwsCloudFrontPrice.where('region_code=?', args[0])
    end
    cf_prices
  end

  # Manual mapping region and region name
  def self.aws_region_mapping(service_source)
  	case service_source
    when "aws"
 			{ 
        'EU (Paris)' => 'eu-west-3', 
        'US West (Oregon)' => 'us-west-2', 
        'EU (London)' => 'eu-west-2', 
        'South America (Sao Paulo)' => 'sa-east-1', 
        'EU (Frankfurt)' => 'eu-central-1', 
        'Asia Pacific (Hong Kong)' => 'ap-east-1', 
        'Asia Pacific (Seoul)' => 'ap-northeast-2', 
        'Asia Pacific (Mumbai)' => 'ap-south-1', 
        'EU (Ireland)' => 'eu-west-1', 
        'US East (N. Virginia)' => 'us-east-1', 
        'US West (N. California)' => 'us-west-1', 
        'Asia Pacific (Singapore)' => 'ap-southeast-1', 
        'Asia Pacific (Sydney)' => 'ap-southeast-2', 
        'EU (London)' => 'eu-west-2', 
        'US East (Ohio)' => 'eu-east-2', 
        'EU (Stockholm)' => 'eu-north-1', 
        'Middle East (Bahrain)' => 'me-south-1', 
        'Canada (Central)' => 'ca-central-1', 
        'Asia Pacific (Tokyo)' => 'ap-northeast-1' 
      }
    else
	  	region_hash = {}
		end
  end

  # Make it so that I can add pricing for more services when needed
  private

  def service_source_default_name
    self.service_source ||= 'aws' if service_source.nil?
  end
end
