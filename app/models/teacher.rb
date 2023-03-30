# frozen_string_literal: true

class Teacher < User
  has_many :exams
  has_many :evaluations
  has_and_belongs_to_many :courses, join_table: :teacher_courses
end
