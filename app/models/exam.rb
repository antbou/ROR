class Exam < ApplicationRecord
    validates :name, presence: true
    validates :consideration, presence: true¨
    validates :passed_at, presence: true

    belongs_to : teacher
end
