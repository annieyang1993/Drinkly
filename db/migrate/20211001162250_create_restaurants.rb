class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table "restaurants", force: :cascade do |t|
      t.string "name", null: false
      t.string "email", null: false
      t.string "phone", null: false
      t.decimal "latitude", precision: 64, scale: 12, null: false
      t.decimal "longitude", precision: 64, scale: 12, null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "price_level"
      t.text "description"
      t.string "img1"
      t.string "img2"
      t.index ["name", "latitude", "longitude"], name: "index_restaurants_on_name_and_latitude_and_longitude", unique: true
    end
  end
end
