# frozen_string_literal: true

class CreateTeacherCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :teacher_courses do |t|
      t.references :teacher, null: false, foreign_key: { to_table: :users }
      t.references :course, null: false, foreign_key: true
      t.timestamps
    end
  end
end
