class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table "locations", force: :cascade do |t|
      t.integer "restaurant_id"
      t.integer "user_id"
      t.string "category"
      t.string "address_1", null: false
      t.string "address_2"
      t.string "address_3"
      t.string "city", null: false
      t.string "state", null: false
      t.string "country", null: false
      t.string "zip"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
  end
  end
end
