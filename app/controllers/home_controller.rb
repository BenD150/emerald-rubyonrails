# This controller generates the homepage using a GET request
class HomeController < ApplicationController
  # The GET request must render the projects, team that the project was assigned to, and the survey for that project.
  def get_info
    @projects = Project.all
    @project_team = TeamProject.all
    @surveys = Survey.all
  end
end
