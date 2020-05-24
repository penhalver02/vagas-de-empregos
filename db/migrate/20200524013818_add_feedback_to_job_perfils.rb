class AddFeedbackToJobPerfils < ActiveRecord::Migration[6.0]
  def change
    add_column :job_perfils, :feedback, :string
    add_column :job_perfils, :rejected, :boolean, default: false
  end
end
