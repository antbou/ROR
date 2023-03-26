class CreateStudentsPromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :students_promotions do |t|
      t.references :student, null: false, foreign_key: { to_table: :users }
      t.references :promotion, null: false, foreign_key: true

      t.date :started_at
      t.date :ended_at
      t.timestamps
    end
  end
end
