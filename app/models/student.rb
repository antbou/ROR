# frozen_string_literal: true

class Student < User
  has_many :evaluations
  has_many :exams, through: :evaluations
end
