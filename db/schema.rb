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

ActiveRecord::Schema[7.0].define(version: 2023_03_28_133557) do
  create_table "categories", force: :cascade do |t|
    t.string "slug"
    t.string "name"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_on_category_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "slug"
    t.string "title"
    t.string "description"
    t.integer "quarter_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_courses_on_category_id"
    t.index ["quarter_id"], name: "index_courses_on_quarter_id"
  end

  create_table "courses_promotions", force: :cascade do |t|
    t.integer "promotion_id", null: false
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_courses_promotions_on_course_id"
    t.index ["promotion_id"], name: "index_courses_promotions_on_promotion_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.decimal "grade"
    t.integer "exam_id", null: false
    t.integer "student_id", null: false
    t.integer "teacher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_evaluations_on_exam_id"
    t.index ["student_id"], name: "index_evaluations_on_student_id"
    t.index ["teacher_id"], name: "index_evaluations_on_teacher_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string "name"
    t.decimal "consideration"
    t.date "passed_at"
    t.integer "course_id", null: false
    t.integer "teacher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_exams_on_course_id"
    t.index ["teacher_id"], name: "index_exams_on_teacher_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "name"
    t.date "start_at"
    t.date "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quarters", force: :cascade do |t|
    t.date "started_at"
    t.date "ended_at"
    t.integer "semester_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["semester_id"], name: "index_quarters_on_semester_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "slug"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "semesters", force: :cascade do |t|
    t.date "started_at"
    t.date "ended_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_semesters", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "semester_id", null: false
    t.boolean "conditonal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["semester_id"], name: "index_student_semesters_on_semester_id"
    t.index ["student_id"], name: "index_student_semesters_on_student_id"
  end

  create_table "students_promotions", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "promotion_id", null: false
    t.date "started_at"
    t.date "ended_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["promotion_id"], name: "index_students_promotions_on_promotion_id"
    t.index ["student_id"], name: "index_students_promotions_on_student_id"
  end

  create_table "teacher_courses", force: :cascade do |t|
    t.integer "teacher_id", null: false
    t.integer "course_id", null: false
    t.index ["course_id"], name: "index_teacher_courses_on_course_id"
    t.index ["teacher_id"], name: "index_teacher_courses_on_teacher_id"
  end

  create_table "user_has_roles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
    t.date "attributed_at"
    t.date "modified_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_has_roles_on_role_id"
    t.index ["user_id"], name: "index_user_has_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "type"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "adress"
    t.string "acronym"
    t.date "birth_date"
    t.integer "city_id", null: false
    t.integer "promotion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["promotion_id"], name: "index_users_on_promotion_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "categories"
  add_foreign_key "courses", "categories"
  add_foreign_key "courses", "quarters"
  add_foreign_key "courses_promotions", "courses"
  add_foreign_key "courses_promotions", "promotions"
  add_foreign_key "evaluations", "exams"
  add_foreign_key "evaluations", "users", column: "student_id"
  add_foreign_key "evaluations", "users", column: "teacher_id"
  add_foreign_key "exams", "courses"
  add_foreign_key "exams", "users", column: "teacher_id"
  add_foreign_key "quarters", "semesters"
  add_foreign_key "student_semesters", "semesters"
  add_foreign_key "student_semesters", "users", column: "student_id"
  add_foreign_key "students_promotions", "promotions"
  add_foreign_key "students_promotions", "users", column: "student_id"
  add_foreign_key "teacher_courses", "courses"
  add_foreign_key "teacher_courses", "users", column: "teacher_id"
  add_foreign_key "user_has_roles", "roles"
  add_foreign_key "user_has_roles", "users"
  add_foreign_key "users", "cities"
  add_foreign_key "users", "promotions"
end
