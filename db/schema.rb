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

ActiveRecord::Schema.define(version: 20180130162046) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "city_searches", force: :cascade do |t|
    t.integer  "search_id"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cta_assigns", force: :cascade do |t|
    t.integer  "cta_station_id"
    t.integer  "cta_line_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cta_lines", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cta_searches", force: :cascade do |t|
    t.integer  "search_id"
    t.integer  "cta_station_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cta_stations", force: :cascade do |t|
    t.string   "name"
    t.float    "lat"
    t.float    "lng"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "listing_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hood_points", force: :cascade do |t|
    t.integer  "neighborhood_id"
    t.string   "lat"
    t.string   "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hood_searches", force: :cascade do |t|
    t.integer  "neighborhood_id"
    t.integer  "search_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", force: :cascade do |t|
    t.string   "address"
    t.string   "lat"
    t.string   "lng"
    t.integer  "user_id"
    t.integer  "beds"
    t.integer  "baths"
    t.integer  "half_baths"
    t.text     "description"
    t.integer  "garage_spaces"
    t.integer  "assigned_parking"
    t.boolean  "active"
    t.integer  "age"
    t.string   "size"
    t.integer  "city_id"
    t.boolean  "heat_gas"
    t.boolean  "heat_radiator"
    t.boolean  "ac_window_units"
    t.boolean  "ac_central"
    t.date     "list_date"
    t.string   "pin"
    t.boolean  "recent_rehab"
    t.boolean  "vintage"
    t.boolean  "new_construction"
    t.integer  "price"
    t.boolean  "rental"
    t.string   "state"
    t.string   "st_num"
    t.string   "street"
    t.string   "st_suffix"
    t.string   "cp"
    t.string   "unit"
    t.string   "zip_code"
    t.string   "property_type"
    t.string   "laundry"
    t.boolean  "cats"
    t.boolean  "dogs"
    t.date     "available_date"
    t.text     "image_urls"
    t.integer  "neighborhood_id"
    t.integer  "picture_count"
    t.string   "mls_id"
    t.string   "lo_mlsid"
    t.string   "la_first_name"
    t.string   "la_last_name"
    t.float    "total_baths"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings_searches", force: :cascade do |t|
    t.integer  "listing_id"
    t.integer  "search_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metra_assigns", force: :cascade do |t|
    t.integer  "metra_line_id"
    t.integer  "metra_station_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metra_lines", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metra_searches", force: :cascade do |t|
    t.integer  "search_id"
    t.integer  "metra_station_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metra_stations", force: :cascade do |t|
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "searches", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "property_type"
    t.integer  "beds"
    t.float    "baths"
    t.integer  "max_price"
    t.boolean  "rental"
    t.boolean  "cats"
    t.boolean  "dogs"
    t.string   "cta_distance"
    t.string   "metra_distance"
    t.string   "parking"
    t.string   "laundry"
    t.string   "name"
    t.integer  "min_price"
    t.text     "old_mlsids"
    t.text     "current_mlsids"
    t.text     "new_mlsids"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "showings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "listing_id"
    t.text     "message"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password"
    t.boolean  "paid"
    t.boolean  "admin"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "comments"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "listings_count"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
