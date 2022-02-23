class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table "stars", force: :cascade do |t|
      t.integer "user_id"
      t.integer "restaurant_id"
      t.integer "stars"
      t.integer "max_stars"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["user_id", "restaurant_id"], name: "index_stars_on_user_id_and_restaurant_id", unique: true
    end
  end
end
