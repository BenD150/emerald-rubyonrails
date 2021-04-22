class FixSurveyReference < ActiveRecord::Migration[6.1]
  def change
    remove_column :surveys, :project_id
    add_column :surveys, :team_project_id, :integer
    add_foreign_key :surveys, :team_projects
  end
end
