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

ActiveRecord::Schema.define(version: 20161206120158) do

  create_table "comments", force: :cascade do |t|
    t.string   "title",       default: "none title"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "song_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "keeps", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_keeps_on_song_id"
    t.index ["user_id"], name: "index_keeps_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["song_id"], name: "index_likes_on_song_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
    t.integer  "view_count",  default: 0
    t.index ["user_id"], name: "index_songs_on_user_id"
    t.index ["view_count"], name: "index_songs_on_view_count"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "song_id"
    t.index ["song_id"], name: "index_tags_on_song_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "fb_uid"
    t.string   "fb_token"
    t.integer  "song_id"
    t.string   "nickname"
    t.string   "role"
    t.string   "profile"
    t.string   "name"
    t.string   "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["fb_uid"], name: "index_users_on_fb_uid"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["song_id"], name: "index_users_on_song_id"
  end

  create_table "ytlinks", force: :cascade do |t|
    t.string   "name"
    t.string   "link"
    t.integer  "user_id"
    t.integer  "song_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
