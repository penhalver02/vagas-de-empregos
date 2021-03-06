# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_18_202356) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.integer "headhunter_id", null: false
    t.integer "profile_id", null: false
    t.string "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["headhunter_id"], name: "index_comments_on_headhunter_id"
    t.index ["profile_id"], name: "index_comments_on_profile_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "headhunter_id", null: false
    t.integer "profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["headhunter_id"], name: "index_favorites_on_headhunter_id"
    t.index ["profile_id"], name: "index_favorites_on_profile_id"
  end

  create_table "headhunters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_headhunters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_headhunters_on_reset_password_token", unique: true
  end

  create_table "job_opportunities", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "skills"
    t.float "salary"
    t.string "job_level"
    t.date "end_data"
    t.string "location"
    t.integer "headhunter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "closed", default: false
    t.index ["headhunter_id"], name: "index_job_opportunities_on_headhunter_id"
  end

  create_table "job_profiles", force: :cascade do |t|
    t.integer "profile_id", null: false
    t.integer "job_opportunity_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "feedback"
    t.boolean "rejected", default: false
    t.index ["job_opportunity_id"], name: "index_job_profiles_on_job_opportunity_id"
    t.index ["profile_id"], name: "index_job_profiles_on_profile_id"
  end

  create_table "offers", force: :cascade do |t|
    t.date "begin_date"
    t.float "salary"
    t.string "benefit"
    t.string "role"
    t.integer "headhunter_id", null: false
    t.integer "job_opportunity_id", null: false
    t.integer "profile_id", null: false
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "feedback"
    t.index ["headhunter_id"], name: "index_offers_on_headhunter_id"
    t.index ["job_opportunity_id"], name: "index_offers_on_job_opportunity_id"
    t.index ["profile_id"], name: "index_offers_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "full_name"
    t.string "social_name"
    t.date "date_birth"
    t.string "degree"
    t.string "description"
    t.string "work_experience"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "headhunters"
  add_foreign_key "comments", "profiles"
  add_foreign_key "favorites", "headhunters"
  add_foreign_key "favorites", "profiles"
  add_foreign_key "job_opportunities", "headhunters"
  add_foreign_key "job_profiles", "job_opportunities"
  add_foreign_key "job_profiles", "profiles"
  add_foreign_key "offers", "headhunters"
  add_foreign_key "offers", "job_opportunities"
  add_foreign_key "offers", "profiles"
  add_foreign_key "profiles", "users"
end
