# frozen_string_literal: true

class Course < ApplicationRecord
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true

  belongs_to :quarter
  belongs_to :category
  has_many :exams, dependent: :destroy

  has_and_belongs_to_many :promotions, join_table: :courses_promotions
  has_and_belongs_to_many :teachers, join_table: :teacher_courses
  has_many :students, through: :promotions

  def to_s
    title
  end
end
