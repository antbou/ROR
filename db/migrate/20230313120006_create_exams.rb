# frozen_string_literal: true

class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string :name
      t.decimal :consideration
      t.date :passed_at

      t.references :teacher, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
