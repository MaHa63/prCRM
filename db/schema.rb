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

ActiveRecord::Schema.define(version: 20200107102926) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name",       limit: 30
    t.string   "street",     limit: 30
    t.integer  "zip_code"
    t.string   "city",       limit: 30
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name", limit: 20, null: false
    t.string   "last_name",  limit: 20, null: false
    t.string   "email"
    t.string   "phone_nbr"
    t.string   "position",   limit: 20
    t.integer  "status",                null: false
    t.integer  "account_id"
    t.integer  "lead_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",           limit: 30,                         null: false
    t.text     "description",    limit: 50
    t.integer  "phase",                                             null: false
    t.decimal  "target_sales",              precision: 8, scale: 2
    t.decimal  "realized_sales",            precision: 8, scale: 2
    t.date     "schedule"
    t.integer  "user_id"
    t.integer  "account_id"
    t.integer  "contact_id"
    t.integer  "lead_id"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.text     "description"
    t.integer  "reason"
    t.integer  "state"
    t.integer  "account_id"
    t.integer  "user_id"
    t.datetime "open"
    t.datetime "closed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
