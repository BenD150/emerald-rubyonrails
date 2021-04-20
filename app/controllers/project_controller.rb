# This controller renders all teams with a GET request and allows teams to be assigned to a project with a POST request.
class ProjectController < ApplicationController
  # The GET request must render all of the teams
  # User.student.projects
  def get_teams
    render json: Team.all
  end

  # The POST request expects JSON with a value that can be made into a new database record. Make a single project and assign multiple teams to it
  # iterate over u.student.projects
  # If a student is assigned a project, they are assigned a teamproject.
  # To get a studen't real project, it is u.student.team_projects.first.team to get the
  def create
    project = Project.create(name: params[:project_name])
    team_ids = params[:team_ids]
    team_ids.each do |team_id|
      TeamProject.create(team_id: team_id, project: project)
    end
  end
end
