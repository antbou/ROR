class CreateStudentSemesters < ActiveRecord::Migration[7.0]
  def change
    create_table :student_semesters do |t|
      t.references :student, null: false, foreign_key: { to_table: :users }
      t.references :semester, null: false, foreign_key: true

      t.boolean :conditonal

      t.timestamps
    end
  end
end
