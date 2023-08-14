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

ActiveRecord::Schema[7.0].define(version: 2023_08_14_030252) do
  create_table "guest_orders", force: :cascade do |t|
    t.string "name"
    t.string "takoyaki_6s"
    t.string "takoyaki_8s"
    t.string "takoyaki_10s"
    t.string "takoyaki_12s"
    t.string "fried_takoyaki"
    t.string "cold_takoyaki"
    t.string "yakisoba"
    t.string "yakisoba_1_half"
    t.string "yakisoba_egg"
    t.string "sobamesi"
    t.string "beer"
    t.string "happoshu"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "takoyaki_toppings", force: :cascade do |t|
    t.integer "guest_order_id"
    t.integer "topping_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_order_id", "topping_id"], name: "index_takoyaki_toppings_on_guest_order_id_and_topping_id", unique: true
    t.index ["guest_order_id"], name: "index_takoyaki_toppings_on_guest_order_id"
    t.index ["topping_id"], name: "index_takoyaki_toppings_on_topping_id"
  end

  create_table "toppings", force: :cascade do |t|
    t.string "plane"
    t.string "sauce"
    t.string "soy_sauce"
    t.string "mayonnaise"
    t.string "flakes"
    t.string "green_seaweed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
