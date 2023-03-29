class CreateCoursesPromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :courses_promotions do |t|
      t.references :promotion, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.timestamps
    end
  end
end
