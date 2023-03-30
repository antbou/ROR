# frozen_string_literal: true

class Promotion < ApplicationRecord
  validates :name, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true

  has_many :students
  has_and_belongs_to_many :courses, join_table: :courses_promotions
end
