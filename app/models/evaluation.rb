class Evaluation < ApplicationRecord
    validates :grade, presence: true
    validates :created_at, presence: true
    validates :updated_at, presence: true

    belongs_to :exam
    belongs_to :student
    belongs_to :teacher
end
