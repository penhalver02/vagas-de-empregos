class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.date :begin_date
      t.float :salary
      t.string :benefit
      t.string :role
      t.references :headhunter, null: false, foreign_key: true
      t.references :job_opportunity, null: false, foreign_key: true
      t.references :perfil, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
