# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_12_24_131204) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "purchase_links", force: :cascade do |t|
    t.boolean "complete"
    t.float "value"
    t.string "url"
    t.bigint "purchases_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchases_id"], name: "index_purchase_links_on_purchases_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "due_date"
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_purchases_on_users_id"
  end

  create_table "task_checks", force: :cascade do |t|
    t.string "description"
    t.boolean "complete"
    t.bigint "tasks_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tasks_id"], name: "index_task_checks_on_tasks_id"
  end

  create_table "task_lists", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_task_lists_on_users_id"
  end

  create_table "task_tags", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.bigint "tasks_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tasks_id"], name: "index_task_tags_on_tasks_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "priority"
    t.datetime "due_date"
    t.bigint "task_lists_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_lists_id"], name: "index_tasks_on_task_lists_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "hashed_password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "purchase_links", "purchases", column: "purchases_id"
  add_foreign_key "purchases", "users", column: "users_id"
  add_foreign_key "task_checks", "tasks", column: "tasks_id"
  add_foreign_key "task_lists", "users", column: "users_id"
  add_foreign_key "task_tags", "tasks", column: "tasks_id"
  add_foreign_key "tasks", "task_lists", column: "task_lists_id"
end
