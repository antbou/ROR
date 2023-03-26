# require 'faker'

city = City.create!(name: 'Paris', zip_code: '75000')
# Create demo teacher
teacher = Teacher.create!(first_name: 'demo', last_name: 'test', email: 'teacher@mail.com',
                          adress: '1 rue de la paix', acronym: 'dmo', city:, password: '123456')

# Create demo student
student1 = Student.create!(first_name: 'deemo', last_name: 'test', email: 'student1@mail.com',
                           adress: '2 rue michel', city:, password: '123456')
student2 = Student.create!(first_name: 'deemo2', last_name: 'test', email: 'student2@mail.com',
                           adress: '2 rue michel', city:, password: '123456')

semester = Semester.create!(started_at: Date.new(2021, 9, 1), ended_at: Date.new(2021, 12, 31))

quarter = Quarter.create!(started_at: Date.new(2021, 9, 1), ended_at: Date.new(2021, 10, 31), semester:)

category = Category.create(slug: 'théorique', name: 'Théorique')

subject1 = Category.create!(slug: 'brge', name: 'Branches générales', category:)

course1 = Course.create!(slug: 'maths', title: 'Mathématiques', category: subject1, quarter:)
course2 = Course.create!(slug: 'physique', title: 'Physique', category: subject1, quarter:)
course3 = Course.create!(slug: 'chimie', title: 'Chimie', category: subject1, quarter:)

# Add demo teacher to course
teacher.courses << course1
teacher.courses << course2
teacher.courses << course3

exam1 = Exam.create!(name: 'Mathématiques', consideration: 100, passed_at: Date.new(2021, 9, 30), course: course1,
                     teacher:)
exam2 = Exam.create!(name: 'Physique', consideration: 100, passed_at: Date.new(2021, 9, 30), course: course2, teacher:)

evaluation1 = Evaluation.create!(grade: 10, student: student1, exam: exam1, teacher:)
evaluation2 = Evaluation.create!(grade: 10, student: student2, exam: exam1, teacher:)
evaluation3 = Evaluation.create!(grade: 10, student: student1, exam: exam2, teacher:)
evaluation4 = Evaluation.create!(grade: 10, student: student2, exam: exam2, teacher:)
