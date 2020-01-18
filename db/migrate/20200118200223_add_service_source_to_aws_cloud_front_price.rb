class AddServiceSourceToAwsCloudFrontPrice < ActiveRecord::Migration[6.0]
  def change
    add_column :aws_cloud_front_prices, :service_source, :string
  end
end
