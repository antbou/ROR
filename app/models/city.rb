# frozen_string_literal: true

class City < ApplicationRecord
  validates :name, presence: true
  validates :zip_code, presence: true
end
