# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150308055315) do

  create_table "allinfos", force: true do |t|
    t.string   "title"
    t.string   "price"
    t.string   "url"
    t.string   "max"
    t.datetime "start_time"
    t.datetime "finish_time"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "allinfos", ["user_id"], name: "index_allinfos_on_user_id"

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "createtime"
    t.datetime "updatetime"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id"

  create_table "goodsinfos", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "houses", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "letters", force: true do |t|
    t.string   "title"
    t.string   "from_id"
    t.string   "belong_id"
    t.text     "content"
    t.integer  "state"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "letters", ["user_id"], name: "index_letters_on_user_id"

  create_table "oneinfos", force: true do |t|
    t.string   "joined_id"
    t.integer  "allinfo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oneinfos", ["allinfo_id"], name: "index_oneinfos_on_allinfo_id"

  create_table "shares", force: true do |t|
    t.string   "title"
    t.text     "link"
    t.text     "limit"
    t.datetime "createtime"
    t.datetime "updatetime"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shares", ["user_id"], name: "index_shares_on_user_id"

  create_table "swaps", force: true do |t|
    t.string   "title"
    t.string   "age"
    t.text     "extent"
    t.text     "want_book"
    t.integer  "state"
    t.string   "guest_id"
    t.integer  "check"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "swaps", ["user_id"], name: "index_swaps_on_user_id"

  create_table "userbooks", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.text     "desc"
    t.datetime "createtime"
    t.datetime "updatetime"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img"
  end

  add_index "userbooks", ["user_id"], name: "index_userbooks_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
