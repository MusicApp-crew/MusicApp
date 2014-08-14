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

ActiveRecord::Schema.define(version: 20140814075719) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_songs", force: true do |t|
    t.integer "song_id"
    t.integer "category_id"
  end

  create_table "instruments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "midis", force: true do |t|
    t.integer "song_id"
    t.string  "url"
  end

  create_table "music_sheets", force: true do |t|
    t.integer "song_id"
    t.string  "url"
  end

  create_table "songs", force: true do |t|
    t.string  "title"
    t.string  "image"
    t.integer "instrument_id", limit: 255
  end

  create_table "songs_tags", force: true do |t|
    t.integer "song_id"
    t.integer "tag_id"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
