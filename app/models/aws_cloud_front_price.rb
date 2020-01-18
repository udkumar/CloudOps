class AwsCloudFrontPrice < ApplicationRecord
	# attr_accessor :id, :description, :begin_range, :end_range, :unit, :price_per_unit, :effective_date
	
	before_save :service_source_default_name
  
  # Make it so that I can add pricing for more services when needed
  private

  def service_source_default_name
    self.service_source ||= 'aws' if self.service_source.nil?
  end
end
