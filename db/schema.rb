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

ActiveRecord::Schema.define(version: 20170105070826) do

  create_table "applies", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "start"
    t.integer  "number"
    t.string   "web"
    t.string   "phone"
    t.string   "picture"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "user_id"
    t.boolean  "is_pass",     default: false
    t.string   "aasm_state",  default: "apply_sended"
    t.index ["aasm_state"], name: "index_applies_on_aasm_state"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "notifiable_id"
    t.string   "notifiable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "read_at"
    t.integer  "recipient_id"
    t.integer  "trigger_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "work_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "attachment"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "status"
    t.boolean  "is_admin",               default: false
    t.boolean  "is_recruiter",           default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "wage_upper_bound"
    t.integer  "wage_lower_bound"
    t.string   "contact_email"
    t.boolean  "is_hidden"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_works_on_user_id"
  end

end
