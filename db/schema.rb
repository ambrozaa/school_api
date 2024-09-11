ActiveRecord::Schema[7.1].define(version: 2024_09_10_135832) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "school_classes", force: :cascade do |t|
    t.integer "number"
    t.string "letter"
    t.integer "students_count"
    t.bigint "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_school_classes_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "surname"
    t.integer "class_id"
    t.integer "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "school_classes", "schools"
end
