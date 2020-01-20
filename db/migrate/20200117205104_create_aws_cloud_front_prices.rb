class CreateAwsCloudFrontPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :aws_cloud_front_prices do |t|
      t.text :description
      t.string :begin_range
      t.string :end_range
      t.string :unit
      t.float :price_per_unit
      t.date :effective_date

      t.timestamps
    end
  end
end
