class AddRegionCodeToAwsCloudFrontPrice < ActiveRecord::Migration[6.0]
  def change
    add_column :aws_cloud_front_prices, :region_code, :string
  end
end
