# frozen_string_literal: true

class Teacher < User
  validates :acronym, presence: true
  has_many :exams
  has_many :evaluations
  has_and_belongs_to_many :courses
end
