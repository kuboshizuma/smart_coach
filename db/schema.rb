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

ActiveRecord::Schema.define(version: 20151225044326) do

  create_table "chat_messages", force: :cascade do |t|
    t.text     "message",      limit: 65535
    t.integer  "message_type", limit: 4
    t.integer  "room_id",      limit: 4
    t.integer  "talker_id",    limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "color",      limit: 255
  end

  create_table "lesson_shifts", force: :cascade do |t|
    t.integer  "weekday",     limit: 4
    t.time     "start_time"
    t.time     "finish_time"
    t.integer  "lesson_id",   limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.string   "title",         limit: 255,               null: false
    t.integer  "coach_id",      limit: 4
    t.integer  "genre_id",      limit: 4
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "thumbnail",     limit: 255
    t.date     "start_day"
    t.integer  "shift_minutes", limit: 4
    t.integer  "student_sum",   limit: 4,     default: 0
    t.text     "desc_goal",     limit: 65535
    t.text     "desc_who",      limit: 65535
    t.text     "desc_what",     limit: 65535
    t.text     "desc_other",    limit: 65535
    t.integer  "month",         limit: 4
  end

  create_table "rooms", force: :cascade do |t|
    t.integer  "lesson_id",      limit: 4
    t.integer  "student_id",     limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "repeat",         limit: 4, default: 1
    t.date     "start_day"
    t.integer  "month",          limit: 4, default: 2
    t.integer  "unread_student", limit: 4, default: 0
    t.integer  "unread_coach",   limit: 4, default: 0
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "nickname",               limit: 255
    t.integer  "user_type",              limit: 4,     default: 0
    t.string   "avatar",                 limit: 255
    t.text     "introduce",              limit: 65535
    t.integer  "age",                    limit: 4
    t.string   "belong",                 limit: 255
    t.text     "facebook",               limit: 65535
    t.text     "twitter",                limit: 65535
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
