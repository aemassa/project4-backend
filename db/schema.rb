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

ActiveRecord::Schema.define(version: 20150909153741) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "photographers", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "token",           null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "photographers", ["created_at"], name: "index_photographers_on_created_at", unique: true, using: :btree
  add_index "photographers", ["email"], name: "index_photographers_on_email", unique: true, using: :btree
  add_index "photographers", ["updated_at"], name: "index_photographers_on_updated_at", unique: true, using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "profile_id"
  end

  add_index "photos", ["profile_id"], name: "index_photos_on_profile_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "website"
    t.string   "phone"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "photographer_id"
  end

  add_index "profiles", ["photographer_id"], name: "index_profiles_on_photographer_id", using: :btree

  add_foreign_key "photos", "profiles"
  add_foreign_key "profiles", "photographers"
end
