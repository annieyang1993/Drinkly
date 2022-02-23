class Create < ActiveRecord::Migration[5.2]
  def change
    create_table "order_sessions", force: :cascade do |t|
      t.integer "restaurant_id"
      t.integer "user_id"
      t.boolean "accepted"
      t.boolean "filled"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.float "subtotal"
      t.float "taxes"
      t.float "service_fee"
      t.string "special_offers"
      t.float "special_offer_deductions"
      t.string "credit_card_type"
      t.string "credit_card_digits"
      t.float "total"
      t.string "accepted_at"
      t.string "filled_at"
      t.boolean "arrived"
      t.string "arrived_at"
      t.boolean "completed"
      t.string "completed_at"
      t.float "ready_at"
      t.index ["ready_at"], name: "index_order_sessions_on_ready_at", order: :desc
    end

  end
end
