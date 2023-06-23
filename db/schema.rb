# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_23_064354) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "app_regions", force: :cascade do |t|
    t.bigint "app_id"
    t.bigint "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_app_regions_on_app_id"
    t.index ["region_id"], name: "index_app_regions_on_region_id"
  end

  create_table "apps", force: :cascade do |t|
    t.string "title"
    t.string "website_url"
    t.string "play_store_url"
    t.string "app_store_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "web_store_url"
    t.string "huawei_store_url"
    t.string "slug"
    t.index ["slug"], name: "index_apps_on_slug", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.geometry "area", limit: {:srid=>0, :type=>"geometry"}
    t.text "wkt_string"
    t.string "slug"
    t.text "notes"
    t.text "description"
    t.index ["slug"], name: "index_regions_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
