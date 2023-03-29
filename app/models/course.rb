# frozen_string_literal: true

class Course < ApplicationRecord
  validates :title, presence: true
  validates :slug, presence: true

  belongs_to :quarter
  belongs_to :category
  has_many :exams, dependent: :destroy

  has_and_belongs_to_many :promotions
  has_many :students, through: :promotions

  # attr_accessor :title, :slug, :description, :category_id, :quarter_id, :promotion_ids
end
