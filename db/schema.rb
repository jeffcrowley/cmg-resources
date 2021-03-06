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

ActiveRecord::Schema.define(version: 20180124204204) do

  create_table "change_orders", force: :cascade do |t|
    t.string "co_num"
    t.string "gc_co_num"
    t.string "name"
    t.date "date_submitted"
    t.date "date_received"
    t.float "initial_co_value"
    t.float "labor_value"
    t.float "approved_co_value"
    t.string "status"
    t.text "notes"
    t.integer "project_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_change_orders_on_project_id"
    t.index ["user_id"], name: "index_change_orders_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_follows_on_project_id"
    t.index ["user_id"], name: "index_follows_on_user_id"
  end

  create_table "history_events", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_history_events_on_project_id"
    t.index ["user_id"], name: "index_history_events_on_user_id"
  end

  create_table "pallets", force: :cascade do |t|
    t.integer "piece_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "return_id"
    t.index ["return_id"], name: "index_pallets_on_return_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.integer "job_num"
    t.float "original_contract_amount"
    t.string "terr_manager"
    t.string "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "returns", force: :cascade do |t|
    t.string "jobsite_street"
    t.string "jobsite_city"
    t.string "jobsite_state"
    t.string "jobsite_zip"
    t.string "distro_center"
    t.string "shipper"
    t.integer "pallet_count"
    t.integer "project_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_returns_on_project_id"
    t.index ["user_id"], name: "index_returns_on_user_id"
  end

  create_table "rfis", force: :cascade do |t|
    t.string "rfi_num"
    t.string "gc_rfi_num"
    t.string "description"
    t.date "date_submitted"
    t.date "date_answered"
    t.string "scope_change"
    t.integer "project_id"
    t.integer "user_id"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["project_id"], name: "index_rfis_on_project_id"
    t.index ["user_id"], name: "index_rfis_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "region"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
