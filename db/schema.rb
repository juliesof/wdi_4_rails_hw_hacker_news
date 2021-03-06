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

ActiveRecord::Schema.define(version: 20140703142435) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.string   "url",             null: false
    t.string   "title",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "submission_date"
  end

  create_table "comments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
    t.datetime "submission_date"
    t.integer  "article_id"
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id", using: :btree

  create_table "points", force: true do |t|
    t.integer "number_of_points", default: 0
    t.integer "user_id"
    t.integer "pointable_id"
    t.string  "pointable_type"
  end

  add_index "points", ["pointable_id", "pointable_type"], name: "index_points_on_pointable_id_and_pointable_type", using: :btree
  add_index "points", ["user_id"], name: "index_points_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
