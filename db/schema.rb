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

ActiveRecord::Schema.define(version: 2022_04_13_234349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "developers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "github"
    t.string "linkedin"
  end

  create_table "non_profits", force: :cascade do |t|
    t.string "non_profit_name"
    t.string "city"
    t.string "state"
    t.string "representative_name"
    t.string "representative_email"
    t.string "category"
    t.integer "ein"
    t.string "mission"
    t.string "street_address"
    t.string "website_url"
    t.string "tagline"
    t.string "zipcode"
    t.string "charity_info_url"
    t.string "country"
  end

  create_table "project_developers", force: :cascade do |t|
    t.bigint "developer_id"
    t.bigint "project_id"
    t.index ["developer_id"], name: "index_project_developers_on_developer_id"
    t.index ["project_id"], name: "index_project_developers_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "non_profit_id"
    t.index ["non_profit_id"], name: "index_projects_on_non_profit_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "type_of_user"
    t.bigint "developer_id"
    t.bigint "non_profit_id"
    t.index ["developer_id"], name: "index_users_on_developer_id"
    t.index ["non_profit_id"], name: "index_users_on_non_profit_id"
  end

  add_foreign_key "project_developers", "developers"
  add_foreign_key "project_developers", "projects"
  add_foreign_key "projects", "non_profits"
  add_foreign_key "users", "developers"
  add_foreign_key "users", "non_profits"
end
