# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_19_184127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aws_cloud_front_prices", force: :cascade do |t|
    t.text "description"
    t.text "begin_range"
    t.text "end_range"
    t.text "unit"
    t.float "price_per_unit"
    t.date "effective_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "region_name"
    t.string "region_code"
    t.string "service_source"
    t.string "rate_code"
    t.index ["effective_date"], name: "index_aws_cloud_front_prices_on_effective_date"
    t.index ["region_code"], name: "index_aws_cloud_front_prices_on_region_code"
  end

end
