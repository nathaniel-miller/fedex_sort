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

ActiveRecord::Schema.define(version: 20170506222122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "position_lists", force: :cascade do |t|
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "list_of_position_ids", default: [],              array: true
  end

  create_table "positions", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "position_number"
    t.string   "priority_level"
    t.boolean  "light_duty_friendly", default: false
    t.boolean  "newbie_friendly",     default: false
    t.boolean  "takes_extra",         default: false
  end

  create_table "positions_users", force: :cascade do |t|
    t.integer "position_id"
    t.integer "user_id"
    t.index ["position_id"], name: "index_positions_users_on_position_id", using: :btree
    t.index ["user_id"], name: "index_positions_users_on_user_id", using: :btree
  end

  create_table "rosters", force: :cascade do |t|
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "list_of_team_member_ids", default: [],              array: true
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sort_types", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
    t.integer  "product_list_id"
    t.integer  "roster_id"
  end

  create_table "sorts", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "sort_type_id"
    t.date     "start_date"
    t.date     "end_date"
  end

  create_table "team_members", force: :cascade do |t|
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "employee_number"
    t.date     "date_of_hire"
    t.string   "position_history"
    t.boolean  "vacation",           default: false
    t.boolean  "absent",             default: false
    t.boolean  "extra",              default: false
    t.boolean  "light_duty",         default: false
    t.integer  "permanent_position", default: 0
  end

  create_table "team_members_users", force: :cascade do |t|
    t.integer "team_member_id"
    t.integer "user_id"
    t.index ["team_member_id"], name: "index_team_members_users_on_team_member_id", using: :btree
    t.index ["user_id"], name: "index_team_members_users_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "positions_users", "positions"
  add_foreign_key "positions_users", "users"
  add_foreign_key "team_members_users", "team_members"
  add_foreign_key "team_members_users", "users"
end
