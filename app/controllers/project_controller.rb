# This controller renders all teams with a GET request and allows teams to be assigned to a project with a POST request.
class ProjectController < ApplicationController
  # The GET request must render all of the teams
  # User.student.projects
  def index
    @projects = Project.all
    @team_projects = TeamProject.all
  end

  # The POST request expects JSON with a value that can be made into a new database record. Make a single project and assign multiple teams to it
  # Don't we also need due_date as a param?
  def create
    due_date = '2021-05-20T11:59:59'
    project = Project.create(name: params[:project_name], due: due_date)
    team_ids = params[:team_ids]
    team_ids.each do |team_id|
      TeamProject.create(team_id: team_id, project: project)
    end
    render json: { success: true }
  end
end
