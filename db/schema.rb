# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_07_191114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.decimal "latitude", precision: 64, scale: 12
    t.decimal "longitude", precision: 64, scale: 12
  end

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
    t.integer "pricing"
    t.decimal "rating"
    t.integer "number_of_ratings"
    t.integer "ready_in"
    t.string "operating_time"
    t.index ["name", "latitude", "longitude"], name: "index_restaurants_on_name_and_latitude_and_longitude", unique: true
  end

  create_table "saves", force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "user_id"
  end

  create_table "stars", force: :cascade do |t|
    t.integer "user_id"
    t.integer "restaurant_id"
    t.integer "stars"
    t.integer "max_stars"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "restaurant_id"], name: "index_stars_on_user_id_and_restaurant_id", unique: true
  end

  create_table "tags", force: :cascade do |t|
    t.integer "restaurant_id"
    t.string "tag"
  end

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
