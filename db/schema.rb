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

ActiveRecord::Schema.define(version: 20180425091307) do

  create_table "bearers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "market_prices", force: :cascade do |t|
    t.string   "currency"
    t.integer  "value_cents"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string   "name"
    t.integer  "bearer_id"
    t.integer  "market_price_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.datetime "deleted_at"
    t.index ["bearer_id"], name: "index_stocks_on_bearer_id"
    t.index ["deleted_at"], name: "index_stocks_on_deleted_at"
    t.index ["market_price_id"], name: "index_stocks_on_market_price_id"
  end

end
