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

ActiveRecord::Schema.define(version: 2020_11_29_201116) do

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

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "website"
    t.float "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "band_memberships", force: :cascade do |t|
    t.integer "band_id", null: false
    t.integer "artist_id", null: false
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_band_memberships_on_artist_id"
    t.index ["band_id"], name: "index_band_memberships_on_band_id"
  end

  create_table "bands", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.text "description"
    t.float "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bands_genres", id: false, force: :cascade do |t|
    t.integer "band_id", null: false
    t.integer "genre_id", null: false
    t.index ["genre_id", "band_id"], name: "index_bands_genres_on_genre_id_and_band_id", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.integer "article_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.integer "venue_id", null: false
    t.text "description"
    t.float "price_min"
    t.float "price_max"
    t.string "source_url"
    t.string "tickets_urls"
    t.string "video_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "band_id"
    t.index ["band_id"], name: "index_events_on_band_id"
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "events_genres", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "genre_id", null: false
    t.index ["genre_id", "event_id"], name: "index_events_genres_on_genre_id_and_event_id", unique: true
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "administrator"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.integer "city_id", null: false
    t.string "street"
    t.string "postalCode"
    t.string "phone"
    t.text "description"
    t.string "website"
    t.float "rating"
    t.integer "capacity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_venues_on_city_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "band_memberships", "artists"
  add_foreign_key "band_memberships", "bands"
  add_foreign_key "comments", "articles"
  add_foreign_key "events", "bands"
  add_foreign_key "events", "venues"
  add_foreign_key "venues", "cities"
end
