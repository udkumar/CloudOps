class AwsCloudFrontPrice < ApplicationRecord
	
	before_save :default_values
  
  # Make it so that I can add pricing for more services when needed
  def default_values
    self.service_source ||= 'aws' if self.service_source.nil?
  end
end
