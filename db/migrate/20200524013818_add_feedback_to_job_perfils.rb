class AddFeedbackToJobProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :job_profiles, :feedback, :string
    add_column :job_profiles, :rejected, :boolean, default: false
  end
end
