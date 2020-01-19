class CreateAwsCloudFrontPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :aws_cloud_front_prices do |t|
      t.text :description
      t.text :begin_range
      t.text :end_range
      t.text :unit
      t.float :price_per_unit
      t.date :effective_date

      t.timestamps
    end
  end
end
