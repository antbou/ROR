# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :adress, presence: true

  belongs_to :city

  before_create :set_city
  accepts_nested_attributes_for :city

  def student?
    is_a?(Student)
  end

  def teacher?
    is_a?(Teacher)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def set_city
    zip_code = city.zip_code
    name = city.name
    city = City.find_or_create_by(zip_code:, name:)
    self.city = city
  end
end
