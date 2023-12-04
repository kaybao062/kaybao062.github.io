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

ActiveRecord::Schema[7.0].define(version: 2023_12_04_041949) do
  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.integer "homework_id"
    t.string "oh_link"
    t.string "prof_email"
    t.string "location"
    t.date "time"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homeworks", force: :cascade do |t|
    t.integer "course_id"
    t.datetime "due_date"
    t.integer "estimated_time"
    t.string "file_path"
    t.text "instruction"
    t.string "questions"
    t.integer "student_id"
    t.string "progress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "journals", force: :cascade do |t|
    t.text "content"
    t.text "title"
    t.string "mood"
    t.string "weather"
    t.date "date"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.integer "course_id"
    t.string "image"
    t.integer "student_id"
    t.string "title"
    t.text "content"
    t.text "questions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "cnet_id"
    t.string "name"
    t.string "password"
    t.date "enroll_date"
    t.date "graduate_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
