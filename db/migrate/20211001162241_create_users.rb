class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table "users", force: :cascade do |t|
      t.string "username", null: false
      t.string "password_digest", null: false
      t.string "session_token", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.string "address"
      t.string "first_name", null: false
      t.string "last_name", null: false
      t.string "number", null: false
      t.string "customer_id"
      t.string "default_card"
      t.index ["session_token"], name: "index_users_on_session_token", unique: true
      t.index ["username"], name: "index_users_on_username", unique: true
    end
  end
end
