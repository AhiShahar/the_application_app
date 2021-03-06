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

ActiveRecord::Schema.define(version: 20161130070958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointment_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.integer  "duration"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "appointments", force: :cascade do |t|
    t.datetime "start_time"
    t.integer  "professional_id"
    t.integer  "appointment_type_id"
    t.integer  "customer_id"
    t.boolean  "available",           default: true
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.text     "password_digest"
    t.text     "image"
    t.boolean  "is_professional", default: false
    t.string   "profession"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.text     "description"
  end

  create_table "work_relations", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "professional_id"
    t.boolean  "approved",        default: false
    t.string   "status"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
