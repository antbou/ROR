class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    # self.abstract_class = true

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :adress, presence: true
    validates :city, presence: true
    belongs_to :city
end
