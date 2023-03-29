class Exam < ApplicationRecord
  # attr_accessor :name, :consideration, :passed_at, :teacher, :course

  validates :name, presence: true
  validates :consideration, presence: true
  validates :passed_at, presence: true

  belongs_to :teacher, class_name: 'User'
  belongs_to :course
  has_many :evaluations, dependent: :destroy
end
