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

ActiveRecord::Schema[7.2].define(version: 2024_09_15_062605) do
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
    t.string "area_status"
    t.string "area_logi"
    t.float "area_lati"
    t.string "area_type"
    t.string "area_pin"
    t.string "area_seo_kword"
    t.string "area_seo_mtag"
    t.text "area_seo_data"
    t.string "area_p_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.bigint "business_category_id"
    t.bigint "business_sub_category_id"
    t.integer "status"
    t.boolean "seo_active", default: false
    t.bigint "business_seo_profile_id"
    t.bigint "social_media_profile_id"
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
    t.index ["area_id"], name: "index_business_cards_on_area_id"
    t.index ["business_category_id"], name: "index_business_cards_on_business_category_id"
    t.index ["business_seo_profile_id"], name: "index_business_cards_on_business_seo_profile_id"
    t.index ["business_sub_category_id"], name: "index_business_cards_on_business_sub_category_id"
    t.index ["city_id"], name: "index_business_cards_on_city_id"
    t.index ["district_id"], name: "index_business_cards_on_district_id"
    t.index ["portal_id"], name: "index_business_cards_on_portal_id"
    t.index ["social_media_profile_id"], name: "index_business_cards_on_social_media_profile_id"
    t.index ["state_id"], name: "index_business_cards_on_state_id"
  end

  create_table "business_categories", force: :cascade do |t|
    t.string "name", limit: 128
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_seo_profiles", force: :cascade do |t|
    t.boolean "active", default: false
    t.string "keywords", limit: 512
    t.string "meta_tag", limit: 256
    t.string "description", limit: 256
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_sub_categories", force: :cascade do |t|
    t.bigint "business_category_id"
    t.string "name", limit: 128
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_category_id"], name: "index_business_sub_categories_on_business_category_id"
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
    t.string "city_seo_kword"
    t.string "city_seo_mtag"
    t.text "city_seo_data"
    t.integer "city_pop11"
    t.float "city_area"
    t.float "city_density"
    t.integer "city_star"
    t.string "city_type"
    t.string "city_tier"
    t.string "city_smart"
    t.string "crime_level"
    t.integer "sdist_id"
    t.string "city_p_status"
    t.string "city_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_cities_on_city_id", unique: true
    t.index ["dist_id"], name: "index_cities_on_dist_id"
    t.index ["state_id"], name: "index_cities_on_state_id"
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
    t.integer "estd_dd"
    t.integer "estd_mm"
    t.integer "estd_yy"
    t.string "dist_seo_kword"
    t.string "dist_seo_mtag"
    t.text "dist_seo_data"
    t.string "dist_block"
    t.string "dist_sdist"
    t.string "dist_p_status"
    t.string "dist_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer "estd_dd"
    t.integer "estd_mm"
    t.integer "estd_yy"
    t.string "state_web"
    t.string "state_lang1"
    t.string "state_lang2"
    t.string "state_seo_kword"
    t.string "state_seo_mtag"
    t.text "state_seo_data"
    t.string "state_p_status"
    t.string "state_status"
    t.string "state_dist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "admin_users", "roles"
  add_foreign_key "areas", "cities", primary_key: "city_id"
  add_foreign_key "areas", "districts", column: "dist_id", primary_key: "dist_id"
  add_foreign_key "areas", "states", primary_key: "state_id"
  add_foreign_key "business_card_links", "business_cards"
  add_foreign_key "business_cards", "areas", primary_key: "area_id"
  add_foreign_key "business_cards", "business_categories"
  add_foreign_key "business_cards", "business_seo_profiles"
  add_foreign_key "business_cards", "business_sub_categories"
  add_foreign_key "business_cards", "cities", primary_key: "city_id"
  add_foreign_key "business_cards", "districts", primary_key: "dist_id"
  add_foreign_key "business_cards", "social_media_profiles"
  add_foreign_key "business_cards", "states", primary_key: "state_id"
  add_foreign_key "business_sub_categories", "business_categories"
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
end
