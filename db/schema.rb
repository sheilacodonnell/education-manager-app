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

ActiveRecord::Schema.define(version: 20200709150103) do

  create_table "assignments", force: :cascade do |t|
    t.integer "subject_id"
    t.integer "teacher_id"
    t.string "title", null: false
    t.datetime "due_date", null: false
    t.index ["subject_id"], name: "index_assignments_on_subject_id"
    t.index ["teacher_id"], name: "index_assignments_on_teacher_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "grade"
    t.decimal "gpa", precision: 5, scale: 2, default: "0.0", null: false
  end

  create_table "subject_students", force: :cascade do |t|
    t.integer "subject_id"
    t.integer "student_id"
    t.decimal "average", precision: 5, scale: 2, default: "0.0", null: false
    t.index ["student_id"], name: "index_subject_students_on_student_id"
    t.index ["subject_id"], name: "index_subject_students_on_subject_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.integer "class_period"
    t.integer "teacher_id"
    t.index ["teacher_id"], name: "index_subjects_on_teacher_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.integer "subject_student_id"
    t.integer "assignment_id"
    t.decimal "grade", precision: 5, scale: 2, default: "0.0", null: false
    t.index ["assignment_id"], name: "index_submissions_on_assignment_id"
    t.index ["subject_student_id"], name: "index_submissions_on_subject_student_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.text "image"
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

end
