class CreatePersonRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :person_roles do |t|
      t.references :person, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true

      t.date :attributed_at
      t.date :modified_at

      t.timestamps
    end
  end
end
