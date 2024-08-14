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

ActiveRecord::Schema[7.1].define(version: 2024_08_13_203938) do
  create_table "active_directory_user_directories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "active_directory_user_id", null: false
    t.bigint "directory_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active_directory_user_id"], name: "idx_on_active_directory_user_id_1ab9b8e5c3"
    t.index ["directory_id"], name: "index_active_directory_user_directories_on_directory_id"
  end

  create_table "active_directory_user_groups", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "active_directory_user_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active_directory_user_id"], name: "index_active_directory_user_groups_on_active_directory_user_id"
    t.index ["group_id"], name: "index_active_directory_user_groups_on_group_id"
  end

  create_table "active_directory_users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.bigint "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pwdad"
    t.index ["client_id"], name: "index_active_directory_users_on_client_id"
  end

  create_table "clients", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.integer "phone"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "computers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "hostname"
    t.date "date"
    t.date "endoflife"
    t.string "assigned_to"
    t.string "processor"
    t.string "memory"
    t.string "type_disk"
    t.boolean "vpn"
    t.string "local_password"
    t.string "local_account"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id", null: false
    t.index ["client_id"], name: "index_computers_on_client_id"
  end

  create_table "directories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_directory_user_directories", "active_directory_users"
  add_foreign_key "active_directory_user_directories", "directories"
  add_foreign_key "active_directory_user_groups", "active_directory_users"
  add_foreign_key "active_directory_user_groups", "groups"
  add_foreign_key "active_directory_users", "clients"
  add_foreign_key "computers", "clients"
end
