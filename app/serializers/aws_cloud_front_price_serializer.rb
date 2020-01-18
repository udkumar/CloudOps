class AwsCloudFrontPriceSerializer
  include FastJsonapi::ObjectSerializer
  
  set_type :effective_date
  attributes :description, :begin_range, :end_range, :unit, :price_per_unit, :effective_date
end
