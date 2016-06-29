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

ActiveRecord::Schema.define(version: 20160629174124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer  "away_team_id"
    t.integer  "home_team_id"
    t.datetime "date_time"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "home_team_score"
    t.integer  "away_team_score"
  end

  create_table "league_admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
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
  end

  add_index "league_admins", ["email"], name: "index_league_admins_on_email", unique: true, using: :btree
  add_index "league_admins", ["reset_password_token"], name: "index_league_admins_on_reset_password_token", unique: true, using: :btree

  create_table "leagues", force: :cascade do |t|
    t.integer  "league_admin_id"
    t.string   "name"
    t.string   "sport"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "jersey_number"
    t.integer  "team_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "author_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_admins", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "first_name",                             null: false
    t.string   "last_name",                              null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "approved",               default: false, null: false
  end

  add_index "team_admins", ["email"], name: "index_team_admins_on_email", unique: true, using: :btree
  add_index "team_admins", ["reset_password_token"], name: "index_team_admins_on_reset_password_token", unique: true, using: :btree

  create_table "teams", force: :cascade do |t|
    t.integer  "team_admin_id"
    t.string   "name"
    t.integer  "league_id"
    t.string   "city"
    t.string   "mascot"
    t.string   "primary_color"
    t.string   "secondary_color"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "trade_players", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "trade_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "current_team_id"
  end

  create_table "trades", force: :cascade do |t|
    t.integer  "proposing_team_id"
    t.integer  "accepting_team_id"
    t.boolean  "accepted"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
