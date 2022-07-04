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

ActiveRecord::Schema[7.0].define(version: 2022_07_04_023024) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
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

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "roles", default: 0
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.string "category_gender"
    t.decimal "category_fees"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_id", null: false
    t.string "category_age"
    t.index ["event_id"], name: "index_categories_on_event_id"
  end

  create_table "collabs", force: :cascade do |t|
    t.string "collab_name"
    t.string "collab_organiser"
    t.string "collab_contact"
    t.string "collab_email"
    t.string "collab_website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "Overview"
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_collabs_on_admin_id"
  end

  create_table "donations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "collab_id", null: false
    t.string "donation_email"
    t.string "donation_nationality"
    t.string "donation_COR"
    t.string "donation_NRIC"
    t.date "donation_dob"
    t.integer "donation_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "donation_name"
    t.string "donation_number"
    t.index ["collab_id"], name: "index_donations_on_collab_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "event_name"
    t.string "event_venue"
    t.date "event_date"
    t.time "event_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "event_status"
    t.text "event_overview"
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_events_on_admin_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id", null: false
    t.string "participant_email"
    t.string "participant_nationality"
    t.string "participant_COR"
    t.string "participant_NRIC"
    t.date "participants_dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "participant_name"
    t.string "participant_phone"
    t.string "participant_status", default: "Registered"
    t.bigint "category_id", null: false
    t.string "shirt_size"
    t.string "participant_gender"
    t.integer "onboard", default: 0
    t.string "participant_postal"
    t.string "participant_city"
    t.string "participant_state"
    t.string "shipping_attention"
    t.string "shipping_address"
    t.string "shipping_postal"
    t.string "shipping_city"
    t.string "shipping_state"
    t.string "shipping_country"
    t.jsonb "data"
    t.index ["category_id"], name: "index_participants_on_category_id"
    t.index ["event_id"], name: "index_participants_on_event_id"
  end

  create_table "results", force: :cascade do |t|
    t.string "result_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_id", null: false
    t.index ["event_id"], name: "index_results_on_event_id"
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
  add_foreign_key "categories", "events"
  add_foreign_key "donations", "collabs"
  add_foreign_key "donations", "users"
  add_foreign_key "participants", "categories"
  add_foreign_key "participants", "events"
  add_foreign_key "participants", "users"
  add_foreign_key "results", "events"
end
