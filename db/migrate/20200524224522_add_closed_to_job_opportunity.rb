class AddClosedToJobOpportunity < ActiveRecord::Migration[6.0]
  def change
    add_column :job_opportunities, :closed, :boolean, default: false
  end
end
