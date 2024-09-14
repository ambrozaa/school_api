ActiveRecord::Schema[7.1].define(version: 2024_09_14_082149) do

  enable_extension "plpgsql"

  create_table "school_classes", force: :cascade do |t|
    t.integer "number", null: false
    t.string "letter", null: false
    t.integer "students_count", default: 0, null: false
    t.bigint "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_school_classes_on_school_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "surname", null: false
    t.integer "class_id", null: false
    t.integer "school_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "auth_token"
  end

  add_foreign_key "school_classes", "schools"
end
