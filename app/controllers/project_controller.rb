# This controller renders all teams with a GET request and allows teams to be assigned to a project with a POST request.
class ProjectController < ApplicationController
  # The GET request must render all of the teams
  def get_teams
    @teams = Team.all
  end

  # The POST request expects a project name and a list of teams to assign it to.
  def assign_project
    @teams.each do |team|
      @team_project = TeamProject.create(team: team, project: params[:project])
    end
  end
end
