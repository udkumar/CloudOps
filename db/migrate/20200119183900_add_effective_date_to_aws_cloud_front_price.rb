class AddEffectiveDateToAwsCloudFrontPrice < ActiveRecord::Migration[6.0]
  def change
    add_index :aws_cloud_front_prices, :effective_date
  end
end
