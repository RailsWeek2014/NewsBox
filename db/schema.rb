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

ActiveRecord::Schema.define(version: 20140908135703) do

  create_table "comments", force: true do |t|
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "feed_entry_id"
  end

  add_index "comments", ["feed_entry_id"], name: "index_comments_on_feed_entry_id"

  create_table "feed_entries", force: true do |t|
    t.string   "name"
    t.text     "summary"
    t.string   "url"
    t.datetime "published_at"
    t.string   "guid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "listener_id"
  end

  add_index "feed_entries", ["listener_id"], name: "index_feed_entries_on_listener_id"

  create_table "listeners", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.text     "comment"
    t.string   "image"
    t.string   "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "newsmessages", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.text     "comment"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
