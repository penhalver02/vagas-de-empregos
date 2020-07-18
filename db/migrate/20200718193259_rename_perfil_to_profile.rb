class RenamePerfilToProfile < ActiveRecord::Migration[6.0]
  def change
    rename_table :perfils, :profile
    rename_table :job_perfils, :job_profiles
    rename_column :comments, :perfil_id, :profile_id
    rename_column :favorites, :perfil_id, :profile_id
    rename_column :job_profiles, :perfil_id, :profile_id
    rename_column :offers, :perfil_id, :profile_id
  end
end
