# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :slug
      t.string :name

      t.references :category, null: true, foreign_key: true
      t.timestamps
    end
  end
end
