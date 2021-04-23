# This controller renders all teams with a GET request and allows teams to be assigned to a project with a POST request.
class ProjectController < ApplicationController
  require 'date'
  protect_from_forgery except: :create
  before_action :authenticate_user!
  before_action :select_course!

  # The GET request renders all the teams in the current course
  def index
    unless current_user.instructor
      render :nothing => true, :status => :unauthorized
    end

    @teams = Team.where(course: $selected_course).collect{|team| {team_name: team.name, team_id: team.id}}
  end

  # The POST request creates a project and it to the selected teams
  def create
    unless current_user.instructor
      render :nothing => true, :status => :unauthorized
    end
    
    # create project
    due_date = DateTime.parse(params[:due_date]) + 4/24.0
    project = Project.create(name: params[:project_name], due: due_date, course: $selected_course)

    # add teams to project
    team_ids = params[:team_ids]
    team_ids.each do |team_id|
      TeamProject.create(team_id: team_id, project: project)
    end

    render json: { success: true }
  end
end
