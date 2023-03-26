# frozen_string_literal: true

class Semester < ApplicationRecord
  validates :started_at, presence: true
  validates :ended_at, presence: true

  has_many :quarters
  has_many :students, through: :student_semesters
end
