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

ActiveRecord::Schema.define(version: 2021_04_13_202206) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "claimants", force: :cascade do |t|
    t.bigint "post_id"
    t.bigint "claimant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["claimant_id"], name: "index_claimants_on_claimant_id"
    t.index ["post_id"], name: "index_claimants_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "tags"
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "city"
    t.string "zip_code"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "claimants", "posts"
  add_foreign_key "claimants", "users", column: "claimant_id"
  add_foreign_key "posts", "users"
end
