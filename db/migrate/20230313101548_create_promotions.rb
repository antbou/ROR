class CreatePromotions < ActiveRecord::Migration[7.0]
  def change
    create_table :promotions do |t|
      t.string :name
      t.date :start_at
      t.date :end_at
      t.timestamps
    end
  end
end
