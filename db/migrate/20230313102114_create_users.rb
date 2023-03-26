# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :type # STI
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :adress
      t.string :acronym, null: true
      t.date :birth_date, null: true
      t.belongs_to :city, null: false, foreign_key: true
      t.belongs_to :promotion, null: true, foreign_key: true
      t.timestamps
    end
  end
end
