class CreatePerfils < ActiveRecord::Migration[6.0]
  def change
    create_table :perfils do |t|
      t.string :full_name
      t.string :social_name
      t.date :date_birth
      t.string :degree
      t.string :description
      t.string :work_experience
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
