class CreateJobProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :job_profiles do |t|
      t.belongs_to :profile, null: false, foreign_key: true
      t.belongs_to :job_opportunity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
