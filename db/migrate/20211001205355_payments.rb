class Payments < ActiveRecord::Migration[5.2]
  def change
    create_table "payments", force: :cascade do |t|
      t.integer "user_id"
      t.string "customer_id"
      t.string "payment_id"
      t.string "credit_card_digits"
      t.string "exp_date"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "card_type"
      t.index ["customer_id", "payment_id"], name: "index_payments_on_customer_id_and_payment_id", unique: true
    end
  end
end
