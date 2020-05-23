class CreateJobPerfils < ActiveRecord::Migration[6.0]
  def change
    create_table :job_perfils do |t|
      t.belongs_to :perfil, null: false, foreign_key: true
      t.belongs_to :job_opportunity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
