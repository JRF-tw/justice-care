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

ActiveRecord::Schema.define(version: 20170202030749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "analyses", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.text     "content"
    t.string   "mindmap_url"
    t.string   "youtube_url"
    t.string   "youtube_id"
    t.string   "discourse_url"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "no",            default: 0
  end

  create_table "analyses_problems", force: :cascade do |t|
    t.integer "analysis_id", null: false
    t.integer "problem_id",  null: false
  end

  add_index "analyses_problems", ["analysis_id", "problem_id"], name: "index_analyses_problems_on_analysis_id_and_problem_id", unique: true, using: :btree

  create_table "problems", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "discourse_url"
    t.integer  "add",                   default: 0,       null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "total_votes_cache",     default: 0
    t.integer  "recently_votes_cache",  default: 0
    t.integer  "total_520_votes_cache", default: 0
    t.string   "status",                default: "step1"
  end

  create_table "problems_solutions", force: :cascade do |t|
    t.integer "problem_id",  null: false
    t.integer "solution_id", null: false
  end

  add_index "problems_solutions", ["problem_id", "solution_id"], name: "index_problems_solutions_on_problem_id_and_solution_id", unique: true, using: :btree

  create_table "redactor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "redactor_assets", ["assetable_type", "assetable_id"], name: "idx_redactor_assetable", using: :btree
  add_index "redactor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_redactor_assetable_type", using: :btree

  create_table "reports", force: :cascade do |t|
    t.integer  "analysis_id"
    t.string   "title"
    t.integer  "no",            default: 0
    t.string   "discourse_url"
    t.string   "mindmap_url"
    t.text     "content"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "solutions", force: :cascade do |t|
    t.string   "title"
    t.integer  "no",            default: 0
    t.string   "discourse_url"
    t.text     "content"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "name",                   default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "admin",                  default: false, null: false
    t.boolean  "is_legal_profession",    default: false, null: false
    t.boolean  "accept_contact",         default: false, null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "provider"
    t.string   "provider_uid"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "problem_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
