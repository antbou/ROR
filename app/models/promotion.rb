class Promotion < ApplicationRecord
    validates :name, presence: true
    validates :start_at, presence: true
    validates :end_at, presence: true

    has_many :students, through: :student_promotions
end
