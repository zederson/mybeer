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

ActiveRecord::Schema.define(version: 20130603144025) do

  create_table "beers", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "style"
    t.string   "brewery"
    t.string   "location"
    t.string   "color"
    t.string   "alcohol"
    t.string   "foam"
    t.string   "aroma"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "beers", ["user_id"], name: "index_beers_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",            limit: 150
    t.string   "email",           limit: 50
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
