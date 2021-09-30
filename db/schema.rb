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

ActiveRecord::Schema.define(version: 2021_09_30_134325) do

  create_table "accesses", force: :cascade do |t|
    t.string "organization_type", null: false
    t.integer "organization_id", null: false
    t.string "postal_code", null: false
    t.integer "prefecture", null: false
    t.string "city", null: false
    t.string "address1", null: false
    t.string "address2"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_type", "organization_id"], name: "index_accesses_on_organization_type_and_organization_id"
  end

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

  create_table "albums", force: :cascade do |t|
    t.integer "laboratory_id", null: false
    t.string "name", null: false
    t.text "introduction", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors", force: :cascade do |t|
    t.string "deliverable_type", null: false
    t.integer "deliverable_id", null: false
    t.integer "user_id"
    t.string "name"
    t.boolean "permit_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deliverable_type", "deliverable_id"], name: "index_authors_on_deliverable_type_and_deliverable_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.text "abstract", null: false
    t.text "linkpath"
    t.integer "laboratory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colleges", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "official_mark_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communities", force: :cascade do |t|
    t.string "name", null: false
    t.text "introduction", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "community_members", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "community_id", null: false
    t.boolean "owner_status", default: false
    t.boolean "permit_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "community_messages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "community_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.boolean "official_mark_status"
    t.boolean "close_status"
    t.text "linkpath"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "company_admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "login_id", null: false
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_company_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_company_admins_on_reset_password_token", unique: true
  end

  create_table "company_images", force: :cascade do |t|
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "confernces", force: :cascade do |t|
    t.string "name", null: false
    t.string "title", null: false
    t.text "abstract", null: false
    t.text "linkpath"
    t.integer "laboratory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.integer "subject", default: 0, null: false
    t.text "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer "company_id", null: false
    t.string "title", null: false
    t.text "body", null: false
    t.text "link_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lab_images", force: :cascade do |t|
    t.integer "laboratory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lab_links", force: :cascade do |t|
    t.string "name"
    t.text "linkpath"
    t.integer "laboratory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lab_members", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "laboratory_id", null: false
    t.integer "post_id", null: false
    t.boolean "authority_status", default: false
    t.boolean "edit_status", default: false
    t.boolean "enrolled_status", default: true
    t.boolean "main_status", default: true
    t.boolean "flex_status", default: false
    t.boolean "permit_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "laboratories", force: :cascade do |t|
    t.string "name", null: false
    t.text "introduction", null: false
    t.string "organization_type", null: false
    t.integer "organization_id", null: false
    t.integer "major_id"
    t.boolean "official_mark_status", default: false
    t.boolean "close_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_type", "organization_id"], name: "index_laboratories_on_organization_type_and_organization_id"
  end

  create_table "majors", force: :cascade do |t|
    t.integer "college_id", null: false
    t.string "faculity", null: false
    t.string "department", null: false
    t.string "section", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.datetime "release_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "papers", force: :cascade do |t|
    t.string "title", null: false
    t.text "abstract", null: false
    t.text "linkpath"
    t.integer "laboratory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "press_releases", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.text "linkpath"
    t.integer "laboratory_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "funding"
    t.string "position"
    t.text "linkpath"
    t.integer "laboratory_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rss_choices", force: :cascade do |t|
    t.integer "user_id"
    t.integer "rss_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rsses", force: :cascade do |t|
    t.text "url"
    t.string "name"
    t.text "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "family_name", null: false
    t.string "given_name", null: false
    t.string "family_name_kana", null: false
    t.string "given_name_kana", null: false
    t.integer "post_id", null: false
    t.boolean "official_mark_status", default: false
    t.boolean "suspended", default: false
    t.string "login_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["family_name_kana", "given_name_kana"], name: "index_users_on_family_name_kana_and_given_name_kana"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
