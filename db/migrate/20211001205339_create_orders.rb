class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table "orders", force: :cascade do |t|
      t.integer "restaurant_id"
      t.integer "item_id"
      t.integer "quantity"
      t.integer "user_id"
      t.boolean "checked_out"
      t.boolean "filled"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "order_session_id"
      t.float "price"
      t.string "item_name"
    end
  end
end
