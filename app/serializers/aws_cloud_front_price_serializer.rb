class AwsCloudFrontPriceSerializer < ActiveModel::Serializer
  attributes :id, :description, :begin_range, :end_range, :unit, :price_per_unit, :effective_date
end
