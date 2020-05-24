class AddFeedbackToOffer < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :feedback, :string
  end
end
