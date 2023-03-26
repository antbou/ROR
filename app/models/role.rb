# frozen_string_literal: true

class Role < ApplicationRecord
  validates :slug, presence: true
  validates :name, presence: true

  has_many :people, through: :person_roles
end
