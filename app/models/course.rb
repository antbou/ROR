# frozen_string_literal: true

class Course < ApplicationRecord
  validates :title, presence: true
  validates :slug, presence: true

  belongs_to :quarter
  belongs_to :category
end
