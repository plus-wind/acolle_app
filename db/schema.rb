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

ActiveRecord::Schema.define(version: 2019_11_13_060634) do

  create_table "addresses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "delivery_name_family_kanji", null: false
    t.string "delivery_name_first_kanji", null: false
    t.string "delivery_name_family_furigana", null: false
    t.string "delivery_name_first_furigana", null: false
    t.string "delivery_postal_code", null: false
    t.string "delivery_address_prefecture", null: false
    t.string "delivery_address_city", null: false
    t.string "delivery_address_number", null: false
    t.string "delivery_address_building"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "arrivals", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "arrival_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "artists", force: :cascade do |t|
    t.string "artist_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.integer "cart_item_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "category", null: false
    t.integer "contact_status", null: false
    t.text "text", null: false
    t.text "reply_text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discs", force: :cascade do |t|
    t.integer "item_id", null: false
    t.string "disc_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "artist_id", null: false
    t.integer "label_id", null: false
    t.integer "genre_id", null: false
    t.string "item_name", null: false
    t.string "item_type", null: false
    t.string "item_image_id"
    t.integer "item_price", null: false
    t.datetime "item_release_date", null: false
    t.integer "item_delete_flag", null: false
    t.bigint "item_view", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels", force: :cascade do |t|
    t.string "label_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "item_id", null: false
    t.integer "order_price", null: false
    t.integer "order_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "delivery_name_family_kanji", null: false
    t.string "delivery_name_first_kanji", null: false
    t.string "delivery_name_family_furigana", null: false
    t.string "delivery_name_first_furigana", null: false
    t.string "delivery_postal_code", null: false
    t.string "delivery_address_prefecture", null: false
    t.string "delivery_address_city", null: false
    t.string "delivery_address_number", null: false
    t.string "delivery_address_building"
    t.integer "order_status", null: false
    t.integer "total_fee", null: false
    t.integer "postage", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.string "review_title", null: false
    t.text "review_content", null: false
    t.decimal "satisfaction", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "song", null: false
    t.integer "disc_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name_family_kanji", null: false
    t.string "name_first_kanji", null: false
    t.string "name_family_furigana", null: false
    t.string "name_first_furigana", null: false
    t.string "postal_code", null: false
    t.string "address_prefecture", null: false
    t.string "address_city", null: false
    t.string "address_number", null: false
    t.string "address_building"
    t.string "phone_number", null: false
    t.integer "delete_flag", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
