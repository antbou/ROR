# frozen_string_literal: true

class Quarter < ApplicationRecord
  validates :started_at, presence: true
  validates :ended_at, presence: true

  belongs_to :semester
end
