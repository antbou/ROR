# require 'faker'

city = City.create!(name: 'Paris', zip_code: '75000')
# Create demo teacher
teacher = Teacher.create!(first_name: 'Prof', last_name: 'CPNV', email: 'teacher@mail.com',
                          adress: '1 rue de la paix', acronym: 'dmo', city:, password: '123456')

teacher2 = Teacher.create!(first_name: 'Michel', last_name: 'Le maître', email: 'teacher2@mail.com',
                           adress: '1 rue de la paix', acronym: 'dmo', city:, password: '123456')

promotion = Promotion.create!(name: 'SIT2a', start_at: Date.new(2021, 9, 1), end_at: Date.new(2022, 6, 30))

# Create demo student
student1 = Student.create!(first_name: 'Anthony', last_name: 'B', email: 'student1@mail.com',
                           adress: '2 rue michel', city:, password: '123456', promotion:)
student2 = Student.create!(first_name: 'Rigolo', last_name: 'Le grand', email: 'student2@mail.com',
                           adress: '2 rue michel', city:, password: '123456', promotion:)

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

exam1 = Exam.create!(name: 'Trigo', consideration: 100, passed_at: Date.new(2021, 9, 30),
                     course: course1, teacher:)
exam2 = Exam.create!(name: 'Algébre', consideration: 100, passed_at: Date.new(2021, 9, 30), course: course1, teacher:)
exam3 = Exam.create!(name: 'Statique', consideration: 100, passed_at: Date.new(2021, 9, 30), course: course2,
                     teacher:)
exam4 = Exam.create!(name: 'Chaleur', consideration: 100, passed_at: Date.new(2021, 9, 30), course: course2,
                     teacher:)
exam5 = Exam.create!(name: 'Explosif', consideration: 33, passed_at: Date.new(2021, 9, 30), course: course3, teacher:)
exam6 = Exam.create!(name: 'Electro', consideration: 22, passed_at: Date.new(2021, 9, 30), course: course3, teacher:)
evaluation1 = Evaluation.create!(grade: 5, student: student1, exam: exam1, teacher:)
evaluation2 = Evaluation.create!(grade: 4, student: student2, exam: exam1, teacher:)
evaluation3 = Evaluation.create!(grade: 3.5, student: student1, exam: exam2, teacher:)
evaluation4 = Evaluation.create!(grade: 3, student: student2, exam: exam2, teacher:)
evaluation5 = Evaluation.create!(grade: 6, student: student1, exam: exam3, teacher:)
evaluation6 = Evaluation.create!(grade: 2, student: student2, exam: exam3, teacher:)
evaluation7 = Evaluation.create!(grade: 6, student: student1, exam: exam4, teacher:)
evaluation8 = Evaluation.create!(grade: 1, student: student2, exam: exam4, teacher:)
evaluation9 = Evaluation.create!(grade: 3, student: student1, exam: exam5, teacher:)
evaluation10 = Evaluation.create!(grade: 4.5, student: student1, exam: exam5, teacher:)
evaluation10 = Evaluation.create!(grade: 6, student: student1, exam: exam5, teacher:)
evaluation11 = Evaluation.create!(grade: 4.5, student: student2, exam: exam5, teacher:)
evaluation12 = Evaluation.create!(grade: 4, student: student2, exam: exam5, teacher:)

# Add promotions to courses
course1.promotions << promotion
course2.promotions << promotion
