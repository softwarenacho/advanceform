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

ActiveRecord::Schema.define(version: 20160901180409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "zoho_id"
    t.string   "email"
    t.text     "message"
    t.string   "activity"
    t.string   "contacto"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.text     "notes"
    t.boolean  "read",                   default: false
    t.integer  "age"
    t.string   "gender"
    t.string   "profesion"
    t.string   "profesion_type"
    t.string   "residence"
    t.string   "availability"
    t.string   "payment_method"
    t.boolean  "scholarship_importance", default: false
    t.string   "knowledge"
    t.date     "call_again"
    t.boolean  "completed_advance_form", default: false
    t.string   "conclusion"
    t.string   "clean_phone"
  end

end
