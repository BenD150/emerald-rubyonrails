class TeamProjectManyToMany < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :team_id
  end
end
