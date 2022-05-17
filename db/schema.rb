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

ActiveRecord::Schema[7.0].define(version: 2022_05_17_093157) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "slides", force: :cascade do |t|
    t.text "content", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "course_id"
    t.integer "sort", default: 0
    t.index ["course_id"], name: "index_slides_on_course_id"
  end

  add_foreign_key "quiz_questions", "quizzes"
  add_foreign_key "quizzes", "slides"
  add_foreign_key "slides", "courses"
end
