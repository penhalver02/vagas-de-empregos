class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :headhunter, null: false, foreign_key: true
      t.references :perfil, null: false, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
