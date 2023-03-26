# frozen_string_literal: true

class Semester < ApplicationRecord
  validates :startd_at, presence: true
  validates :end_at, presence: true

  has_many :quarters
  has_many :students, through: :student_semesters
end
