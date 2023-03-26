# frozen_string_literal: true

class Evaluation < ApplicationRecord
  validates :grade, presence: true

  belongs_to :exam
  belongs_to :student, class_name: 'User'
  belongs_to :teacher, class_name: 'User'
end
