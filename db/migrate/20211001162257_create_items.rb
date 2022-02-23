class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table "items", force: :cascade do |t|
      t.string "item_name", null: false
      t.boolean "availability", null: false
      t.integer "restaurant_id", null: false
      t.decimal "price", precision: 4, null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "section"
      t.string "img"
      t.text "item_description"
      t.text "additional_info"
      t.index ["item_name", "restaurant_id"], name: "index_items_on_item_name_and_restaurant_id", unique: true
    end    
  end
end
