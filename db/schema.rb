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

ActiveRecord::Schema.define(version: 2020_03_26_190042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "account_type"
    t.integer "discount"
    t.boolean "priority_shipping"
    t.boolean "domestic"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "sku"
    t.string "name"
    t.integer "price"
    t.float "margin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "social_security_number"
    t.string "IBAN"
    t.string "phone"
    t.string "gender"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_users_on_account_id"
  end

  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "users", "accounts"

  create_view "international_user_orders", sql_definition: <<-SQL
      SELECT orders.id,
      orders.created_at AS order_created_at,
      orders.status AS order_status,
      users.id AS _user_id,
      users.name AS _user_name,
      users.address AS _user_address,
      accounts.account_type AS _user_account_type
     FROM ((orders
       JOIN users ON ((users.id = orders.user_id)))
       JOIN accounts ON ((accounts.id = users.account_id)))
    WHERE (accounts.domestic = true);
  SQL
  create_view "m_international_user_orders", materialized: true, sql_definition: <<-SQL
      SELECT orders.id,
      orders.created_at AS order_created_at,
      orders.status AS order_status,
      users.id AS _user_id,
      users.name AS _user_name,
      users.address AS _user_address,
      users.phone AS _user_phone,
      accounts.account_type AS _user_account_type
     FROM ((orders
       JOIN users ON ((users.id = orders.user_id)))
       JOIN accounts ON ((accounts.id = users.account_id)))
    WHERE (accounts.domestic = true);
  SQL
end
