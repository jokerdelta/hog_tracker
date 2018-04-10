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

ActiveRecord::Schema.define(version: 5) do

  create_table "FFAs", force: :cascade do |t|
    t.string "chapter"
    t.string "address"
  end

  create_table "hogs", force: :cascade do |t|
    t.string  "name"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string  "username"
    t.string  "email"
    t.string  "password"
    t.string  "password_digest"
    t.integer "ffa_id"
    t.string  "fair_date"
  end

  create_table "weights", force: :cascade do |t|
    t.integer "week_1"
    t.integer "week_2"
    t.integer "week_3"
    t.integer "week_4"
    t.integer "week_5"
    t.integer "week_6"
    t.integer "week_7"
    t.integer "week_8"
    t.integer "week_9"
    t.integer "week_10"
    t.integer "week_11"
    t.integer "week_12"
    t.integer "week_13"
    t.integer "week_14"
    t.integer "week_15"
    t.integer "hog_id"
  end

end
