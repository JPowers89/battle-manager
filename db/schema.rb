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

ActiveRecord::Schema.define(version: 2019_03_01_191919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "type"
    t.integer "initiative", default: 0
    t.integer "max_hp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "combatants", force: :cascade do |t|
    t.integer "initiative", default: 0
    t.integer "current_hp", default: 0
    t.integer "position", default: -1
    t.boolean "active", default: false
    t.string "name", null: false
    t.bigint "character_id"
    t.bigint "combat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "max_hp", default: 0
    t.integer "init_mod", default: 0
    t.index ["character_id"], name: "index_combatants_on_character_id"
    t.index ["combat_id"], name: "index_combatants_on_combat_id"
    t.index ["name"], name: "index_combatants_on_name"
  end

  create_table "combats", force: :cascade do |t|
    t.integer "round", default: 1
    t.integer "duration", default: 1
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: false
    t.index ["user_id"], name: "index_combats_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "combatants", "characters"
  add_foreign_key "combatants", "combats"
  add_foreign_key "combats", "users"
end
