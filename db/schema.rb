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

ActiveRecord::Schema.define(version: 2019_08_02_103527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "observeds", force: :cascade do |t|
    t.string "class_name"
    t.integer "object_id"
    t.string "status"
    t.bigint "observer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["observer_id"], name: "index_observeds_on_observer_id"
  end

  create_table "observers", force: :cascade do |t|
    t.string "class_list"
    t.integer "processes_count", default: 0
    t.integer "processed_count", default: 0
    t.string "status"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "age"
    t.string "job"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "observeds", "observers"
end
