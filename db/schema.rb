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

ActiveRecord::Schema[7.0].define(version: 2022_07_16_094604) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "courses", default: {}
    t.jsonb "exercises", default: {}
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "checkbox_exercises", force: :cascade do |t|
    t.text "content", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "slide_id"
    t.index ["slide_id"], name: "index_checkbox_exercises_on_slide_id"
  end

  create_table "checkboxes", force: :cascade do |t|
    t.text "content"
    t.bigint "checkbox_exercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "correct_answer", default: "no"
    t.index ["checkbox_exercise_id"], name: "index_checkboxes_on_checkbox_exercise_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description", default: ""
  end

  create_table "media", force: :cascade do |t|
    t.string "name", default: ""
    t.text "alt_text", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "open_questions", force: :cascade do |t|
    t.bigint "slide_id"
    t.text "content", default: ""
    t.text "correct_answer", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slide_id"], name: "index_open_questions_on_slide_id"
  end

  create_table "point_systems", force: :cascade do |t|
    t.integer "total_possible_points"
    t.integer "points_deduction_for_mistake"
    t.string "pointsystemable_type"
    t.bigint "pointsystemable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pointsystemable_type", "pointsystemable_id"], name: "index_point_systems_on_pointsystemable"
  end

  create_table "quiz_questions", force: :cascade do |t|
    t.text "content", default: ""
    t.string "correct_answer", default: "no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "quiz_id"
    t.index ["quiz_id"], name: "index_quiz_questions_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.text "content", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "slide_id"
    t.index ["slide_id"], name: "index_quizzes_on_slide_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slides", force: :cascade do |t|
    t.text "content", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.integer "sort", default: 0
    t.index ["course_id"], name: "index_slides_on_course_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
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

  add_foreign_key "accounts", "users"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "checkbox_exercises", "slides"
  add_foreign_key "checkboxes", "checkbox_exercises"
  add_foreign_key "open_questions", "slides"
  add_foreign_key "quiz_questions", "quizzes"
  add_foreign_key "quizzes", "slides"
  add_foreign_key "slides", "courses"
end
