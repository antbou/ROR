class Student < User
    validates :birth_date, presence: true
end
