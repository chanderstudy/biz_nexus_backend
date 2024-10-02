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

ActiveRecord::Schema[7.2].define(version: 2024_10_02_100044) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "role_id"
    t.string "name"
    t.string "mobile"
    t.string "sex"
    t.string "blood_group"
    t.string "aadhar_card", limit: 12
    t.string "pan_card", limit: 10
    t.string "gst_number", limit: 15
    t.string "address"
    t.string "landmark"
    t.string "qualification"
    t.bigint "pincode"
    t.datetime "dob"
    t.datetime "dom"
    t.bigint "added_by"
    t.bigint "portal_id"
    t.integer "continent_id"
    t.integer "country_id"
    t.integer "state_id"
    t.integer "dist_id"
    t.integer "city_id"
    t.string "area_id"
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_admin_users_on_role_id"
  end

  create_table "areas", primary_key: "area_id", force: :cascade do |t|
    t.integer "city_id", null: false
    t.integer "dist_id", null: false
    t.integer "state_id", null: false
    t.string "area_name"
    t.text "area_detail"
    t.string "area_reach_img"
    t.string "area_map"
    t.integer "area_star"
    t.string "crime_level"
    t.string "area_logi"
    t.float "area_lati"
    t.string "area_type"
    t.string "area_pin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "area_slug"
    t.string "area_post_office"
    t.string "video_url"
    t.boolean "publish", default: true
    t.index ["area_id"], name: "index_areas_on_area_id", unique: true
    t.index ["city_id"], name: "index_areas_on_city_id"
    t.index ["dist_id"], name: "index_areas_on_dist_id"
    t.index ["state_id"], name: "index_areas_on_state_id"
  end

  create_table "business_card_links", force: :cascade do |t|
    t.bigint "business_card_id"
    t.integer "type"
    t.integer "priority"
    t.string "title"
    t.string "url"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_card_id"], name: "index_business_card_links_on_business_card_id"
  end

  create_table "business_cards", force: :cascade do |t|
    t.string "name", limit: 128, null: false
    t.string "owner_name", limit: 128
    t.string "email", limit: 64
    t.string "address", limit: 128
    t.string "landmark", limit: 128
    t.string "mobile", limit: 32
    t.string "latitude"
    t.string "longitude"
    t.integer "bcard_type"
    t.integer "bcard_power"
    t.bigint "business_sub_category_id"
    t.integer "status"
    t.boolean "seo_active", default: false
    t.string "website", limit: 94
    t.string "bank_account", limit: 15
    t.string "bank_ifsc"
    t.integer "bank_type"
    t.boolean "qrcode_active", default: false
    t.string "qrcode_file", limit: 128
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "state_id"
    t.bigint "district_id"
    t.bigint "city_id"
    t.bigint "area_id"
    t.bigint "portal_id"
    t.string "description"
    t.string "owner_designation"
    t.string "work_phone_number"
    t.date "established_date"
    t.bigint "created_by"
    t.bigint "managed_by"
    t.string "short_url"
    t.boolean "published", default: false
    t.string "promotion_type"
    t.bigint "plan_id"
    t.boolean "qr_publish", default: false
    t.string "bank_name"
    t.boolean "legal_publish", default: false
    t.string "business_pan_card"
    t.string "gst_number"
    t.boolean "service_publish", default: false
    t.boolean "catalog_publish", default: false
    t.boolean "social_media_publish", default: false
    t.boolean "photo_gallery_publish", default: false
    t.boolean "video_gallery_publish", default: false
    t.boolean "feedback_publish", default: false
    t.boolean "enquiry_publish", default: false
    t.boolean "external_portal_publish", default: false
    t.text "achivement"
    t.index ["area_id"], name: "index_business_cards_on_area_id"
    t.index ["business_sub_category_id"], name: "index_business_cards_on_business_sub_category_id"
    t.index ["city_id"], name: "index_business_cards_on_city_id"
    t.index ["district_id"], name: "index_business_cards_on_district_id"
    t.index ["portal_id"], name: "index_business_cards_on_portal_id"
    t.index ["state_id"], name: "index_business_cards_on_state_id"
  end

  create_table "business_categories", force: :cascade do |t|
    t.string "name", limit: 128
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "code"
    t.string "slug"
    t.integer "priority"
    t.boolean "publish"
    t.string "category_type"
  end

  create_table "business_seo_profiles", force: :cascade do |t|
    t.boolean "active", default: false
    t.string "keywords", limit: 512
    t.string "meta_tag", limit: 256
    t.string "description", limit: 256
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "business_card_id"
    t.index ["business_card_id"], name: "index_business_seo_profiles_on_business_card_id"
  end

  create_table "business_sub_categories", force: :cascade do |t|
    t.string "name", limit: 128
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "code"
    t.string "slug"
    t.integer "priority"
    t.boolean "publish"
    t.integer "business_category_ids", default: [], array: true
  end

  create_table "cities", primary_key: "city_id", force: :cascade do |t|
    t.integer "dist_id", null: false
    t.integer "state_id", null: false
    t.string "city_name"
    t.text "city_detail"
    t.string "city_lang1"
    t.string "city_lang2"
    t.string "city_logi"
    t.float "city_lati"
    t.string "city_reach_img"
    t.string "city_map"
    t.integer "city_pop11"
    t.float "city_area"
    t.float "city_density"
    t.integer "city_star"
    t.string "city_type"
    t.string "city_tier"
    t.string "city_smart"
    t.string "crime_level"
    t.integer "sdist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "video_url"
    t.string "city_slug"
    t.boolean "publish", default: true
    t.index ["city_id"], name: "index_cities_on_city_id", unique: true
    t.index ["dist_id"], name: "index_cities_on_dist_id"
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "continents", force: :cascade do |t|
    t.string "name", limit: 64
    t.text "detail"
    t.string "population", limit: 15
    t.string "area_land", limit: 15
    t.string "area_density", limit: 10
    t.string "population_share", limit: 4
    t.string "photo", limit: 64
    t.string "video_url", limit: 256
    t.string "map", limit: 64
    t.string "slug", limit: 128
    t.integer "publish", limit: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.integer "continent_id"
    t.string "sub_continent"
    t.string "sovereignty"
    t.string "economy_type"
    t.string "name"
    t.text "country_detail"
    t.string "iso3"
    t.string "iso2"
    t.string "population"
    t.string "area_land"
    t.string "area_density"
    t.integer "numeric_code"
    t.integer "phone_code"
    t.string "capital"
    t.string "currency_name"
    t.string "currency_code"
    t.string "currency_symbol"
    t.string "tld"
    t.string "timezones"
    t.string "latitude"
    t.string "longitude"
    t.string "nationality"
    t.string "photo"
    t.string "official_map"
    t.string "estd_date"
    t.string "official_web_url"
    t.integer "official_lang1"
    t.integer "official_lang2"
    t.string "slug"
    t.integer "publish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.integer "type"
    t.integer "created_for"
    t.string "name"
    t.string "code"
    t.integer "percentage"
    t.integer "fix_discount"
    t.integer "max_discount"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "description"
    t.integer "priority"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", primary_key: "dist_id", force: :cascade do |t|
    t.integer "state_id", null: false
    t.string "dist_cd"
    t.string "dist_name"
    t.string "dist_hq"
    t.text "dist_detail"
    t.integer "dist_pop11"
    t.float "dist_area"
    t.float "dist_density"
    t.string "dist_web"
    t.string "dist_lang1"
    t.string "dist_lang2"
    t.string "dist_logi"
    t.float "dist_lati"
    t.string "dist_reach_img"
    t.string "dist_map"
    t.string "dist_block"
    t.string "dist_sdist"
    t.string "dist_p_status"
    t.string "dist_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "video_url"
    t.string "web_url"
    t.datetime "established_date"
    t.index ["dist_id"], name: "index_districts_on_dist_id", unique: true
    t.index ["state_id"], name: "index_districts_on_state_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.string "document_type"
    t.integer "status"
    t.integer "priority"
    t.string "documentable_type", null: false
    t.bigint "documentable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["documentable_type", "documentable_id"], name: "index_documents_on_documentable"
  end

  create_table "faqs", force: :cascade do |t|
    t.string "question", null: false
    t.text "answer", null: false
    t.string "faqable_type"
    t.bigint "faqable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["faqable_type", "faqable_id"], name: "index_faqs_on_faqable"
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_invoice"
    t.bigint "agent_id"
    t.bigint "user_id"
    t.bigint "placed_by_id"
    t.bigint "plan_id"
    t.text "description"
    t.integer "mrp"
    t.jsonb "coupon"
    t.integer "discount"
    t.string "extra_charge_details"
    t.integer "extra_charge"
    t.integer "gst"
    t.integer "net_amount"
    t.bigint "transaction_id"
    t.bigint "payment_received_by_id"
    t.bigint "subscription_id"
    t.string "order_remark"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agent_id"], name: "index_orders_on_agent_id"
    t.index ["payment_received_by_id"], name: "index_orders_on_payment_received_by_id"
    t.index ["placed_by_id"], name: "index_orders_on_placed_by_id"
    t.index ["plan_id"], name: "index_orders_on_plan_id"
    t.index ["subscription_id"], name: "index_orders_on_subscription_id"
    t.index ["transaction_id"], name: "index_orders_on_transaction_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "discount"
    t.integer "duration"
    t.string "description"
    t.integer "priority"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portals", force: :cascade do |t|
    t.string "portal_name"
    t.string "portal_remark"
    t.string "portal_url"
    t.string "portal_msg"
    t.integer "portal_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_media_profiles", force: :cascade do |t|
    t.string "facebook", limit: 15
    t.string "youtube", limit: 15
    t.string "instagram", limit: 15
    t.string "linkedin", limit: 15
    t.string "other", limit: 15
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "business_card_id"
    t.index ["business_card_id"], name: "index_social_media_profiles_on_business_card_id"
  end

  create_table "states", primary_key: "state_id", force: :cascade do |t|
    t.string "state_type"
    t.string "state_name"
    t.string "state_hq"
    t.string "state_cd"
    t.text "state_detail"
    t.string "state_logi"
    t.float "state_lati"
    t.float "state_reach_img"
    t.string "state_map"
    t.string "state_web"
    t.string "state_lang1"
    t.string "state_lang2"
    t.string "state_dist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "country_id"
    t.string "state_slug"
    t.string "population"
    t.string "area_land"
    t.string "area_density"
    t.boolean "publish", default: false
    t.string "video_url"
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "payment_mode"
    t.string "payment_id"
    t.integer "amount"
    t.integer "status"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_transactions_on_payment_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "mobile"
    t.string "sex"
    t.string "blood_group"
    t.string "address"
    t.string "landmark"
    t.string "qualification"
    t.datetime "dob"
    t.datetime "dom"
    t.boolean "status", default: false
    t.bigint "portal_id"
    t.integer "continent_id"
    t.integer "country_id"
    t.integer "state_id"
    t.integer "dist_id"
    t.integer "city_id"
    t.string "area_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "admin_users", "admin_users", column: "added_by"
  add_foreign_key "admin_users", "cities", primary_key: "city_id"
  add_foreign_key "admin_users", "continents"
  add_foreign_key "admin_users", "countries"
  add_foreign_key "admin_users", "districts", column: "dist_id", primary_key: "dist_id"
  add_foreign_key "admin_users", "portals"
  add_foreign_key "admin_users", "roles"
  add_foreign_key "admin_users", "states", primary_key: "state_id"
  add_foreign_key "areas", "cities", primary_key: "city_id"
  add_foreign_key "areas", "districts", column: "dist_id", primary_key: "dist_id"
  add_foreign_key "areas", "states", primary_key: "state_id"
  add_foreign_key "business_card_links", "business_cards"
  add_foreign_key "business_cards", "admin_users", column: "created_by"
  add_foreign_key "business_cards", "admin_users", column: "managed_by"
  add_foreign_key "business_cards", "areas", primary_key: "area_id"
  add_foreign_key "business_cards", "business_sub_categories"
  add_foreign_key "business_cards", "cities", primary_key: "city_id"
  add_foreign_key "business_cards", "districts", primary_key: "dist_id"
  add_foreign_key "business_cards", "plans"
  add_foreign_key "business_cards", "states", primary_key: "state_id"
  add_foreign_key "business_seo_profiles", "business_cards"
  add_foreign_key "cities", "districts", column: "dist_id", primary_key: "dist_id"
  add_foreign_key "cities", "states", primary_key: "state_id"
  add_foreign_key "districts", "states", primary_key: "state_id"
  add_foreign_key "orders", "plans"
  add_foreign_key "orders", "subscriptions"
  add_foreign_key "orders", "transactions"
  add_foreign_key "orders", "users"
  add_foreign_key "orders", "users", column: "agent_id"
  add_foreign_key "orders", "users", column: "payment_received_by_id"
  add_foreign_key "orders", "users", column: "placed_by_id"
  add_foreign_key "social_media_profiles", "business_cards"
  add_foreign_key "states", "countries"
  add_foreign_key "users", "cities", primary_key: "city_id"
  add_foreign_key "users", "continents"
  add_foreign_key "users", "countries"
  add_foreign_key "users", "districts", column: "dist_id", primary_key: "dist_id"
  add_foreign_key "users", "portals"
  add_foreign_key "users", "states", primary_key: "state_id"
end
