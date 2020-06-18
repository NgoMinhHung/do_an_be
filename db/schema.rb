# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_14_133322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "email"
    t.string "password_digest"
    t.boolean "is_activated", default: false
    t.datetime "activated_at"
    t.string "activation_code"
    t.string "activation_code_expired_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
  end

  create_table "budgets", force: :cascade do |t|
    t.float "total", default: 0.0
    t.float "atm", default: 0.0
    t.float "cash", default: 0.0
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "has_limited_outcome_per_week", default: false
    t.float "limited_outcome_per_week", default: 0.0
    t.boolean "has_limited_outcome_per_month", default: false
    t.float "limited_outcome_per_month", default: 0.0
    t.index ["user_id"], name: "index_budgets_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
  end

  create_table "categories_transaction_items", force: :cascade do |t|
    t.bigint "transaction_item_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_categories_transaction_items_on_category_id"
    t.index ["transaction_item_id"], name: "index_categories_transaction_items_on_transaction_item_id"
  end

# Could not dump table "transaction_items" because of following StandardError
#   Unknown type 'transaction_types' for column 'transaction_type'

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone"
    t.boolean "gender", default: false
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_url"
  end

  add_foreign_key "categories_transaction_items", "categories"
  add_foreign_key "categories_transaction_items", "transaction_items"
  add_foreign_key "transaction_items", "users"
end
