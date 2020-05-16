class CreateJobOpportunities < ActiveRecord::Migration[6.0]
  def change
    create_table :job_opportunities do |t|
      t.string :title
      t.text :description
      t.string :skills
      t.float :salary
      t.string :job_level
      t.date :end_data
      t.string :location
      t.references :headhunter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
