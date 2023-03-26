class Category < ApplicationRecord
    validates :name, presence: true
    validates :slug, presence: true

    belongs_to :category
end
