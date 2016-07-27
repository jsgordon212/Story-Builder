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

ActiveRecord::Schema.define(version: 20160726235727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chapter_characters", force: :cascade do |t|
    t.integer  "character_id"
    t.integer  "chapter_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["chapter_id"], name: "index_chapter_characters_on_chapter_id", using: :btree
    t.index ["character_id"], name: "index_chapter_characters_on_character_id", using: :btree
  end

  create_table "chapters", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "chapter_number", null: false
    t.string   "chapter_title"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["project_id"], name: "index_chapters_on_project_id", using: :btree
  end

  create_table "characters", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name",        null: false
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["project_id"], name: "index_characters_on_project_id", using: :btree
  end

  create_table "plot_points", force: :cascade do |t|
    t.boolean  "main_plot",   null: false
    t.integer  "chapter_id"
    t.integer  "project_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["chapter_id"], name: "index_plot_points_on_chapter_id", using: :btree
    t.index ["project_id"], name: "index_plot_points_on_project_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title",      null: false
    t.text     "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_projects_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "chapter_characters", "chapters"
  add_foreign_key "chapter_characters", "characters"
  add_foreign_key "chapters", "projects"
  add_foreign_key "characters", "projects"
  add_foreign_key "plot_points", "chapters"
  add_foreign_key "plot_points", "projects"
  add_foreign_key "projects", "users"
end
