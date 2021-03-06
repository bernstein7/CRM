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

ActiveRecord::Schema.define(version: 20150421055942) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "levels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.string   "alt"
    t.string   "href"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "table_id"
  end

  create_table "meetings", force: :cascade do |t|
    t.integer  "meeting_id"
    t.string   "title"
    t.string   "description"
    t.string   "location"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.datetime "datetime"
    t.integer  "user_id"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options_for_plans", force: :cascade do |t|
    t.integer "plan_id"
    t.integer "option_id"
    t.string  "option_type"
  end

  create_table "plans", force: :cascade do |t|
    t.date    "date_from"
    t.date    "date_to"
    t.string  "for_type",   default: "sale"
    t.integer "count",      default: 0
    t.integer "percentage", default: 0
  end

  create_table "sold_tasks", force: :cascade do |t|
    t.integer  "task_id"
    t.integer  "price"
    t.date     "date_start"
    t.date     "date_end"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sources", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "for_type",   default: "sale"
  end

  create_table "specializations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statistics", force: :cascade do |t|
    t.integer "statistic_id"
    t.string  "for_type"
    t.integer "level_id"
    t.integer "specialization_id"
    t.integer "source_id"
    t.date    "week"
    t.integer "status_id"
    t.integer "user_id"
    t.integer "count",             default: 1
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "for_type",   default: "sale"
  end

  create_table "table_comments", force: :cascade do |t|
    t.integer  "table_id"
    t.integer  "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tables", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.integer  "level_id"
    t.integer  "specialization_id"
    t.string   "email"
    t.integer  "source_id"
    t.date     "date"
    t.integer  "status_id"
    t.string   "topic"
    t.string   "skype"
    t.integer  "user_id"
    t.integer  "price"
    t.date     "date_start"
    t.date     "date_end"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.datetime "reminder_date"
  end

  create_table "task_comments", force: :cascade do |t|
    t.integer  "task_id"
    t.integer  "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.string   "skype"
    t.string   "email"
    t.text     "links"
    t.date     "date"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "source_id"
    t.string   "topic"
    t.integer  "status_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin",                  default: false
    t.string   "status",                 default: "unlock"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
