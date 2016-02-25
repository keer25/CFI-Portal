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

ActiveRecord::Schema.define(version: 20160221063808) do

  create_table "bills", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "project_id"
    t.integer  "user_id"
    t.date     "purchase_date"
    t.decimal  "amount"
  end

  add_index "bills", ["project_id"], name: "index_bills_on_project_id"
  add_index "bills", ["user_id", "created_at"], name: "index_bills_on_user_id_and_created_at"
  add_index "bills", ["user_id"], name: "index_bills_on_user_id"

  create_table "clubs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "club_id"
  end

  add_index "projects", ["club_id"], name: "index_projects_on_club_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.integer  "club_id"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["club_id"], name: "index_users_on_club_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
