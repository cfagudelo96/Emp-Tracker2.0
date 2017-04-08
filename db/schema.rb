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

ActiveRecord::Schema.define(version: 20170408014215) do

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.integer  "identification"
    t.integer  "area_id"
    t.date     "admission_date"
    t.boolean  "active"
    t.string   "position"
    t.integer  "company_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "trainings", force: :cascade do |t|
    t.string   "type"
    t.string   "topic"
    t.text     "objective"
    t.integer  "company_id"
    t.datetime "date"
    t.float    "hourly_intensity"
    t.string   "trainer"
    t.boolean  "internal"
    t.boolean  "planned"
    t.integer  "planned_training_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

end
