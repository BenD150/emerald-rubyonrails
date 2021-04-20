# This controller generates the homepage using a GET request
class HomeController < ApplicationController
  # The GET request must render the projects, team that the project was assigned to, and the survey for that project.
  def index
    if user_signed_in?
      @rows = current_user.student.team_projects.collect{ |team_project|
        {
          class_name: "Class Name Here",
          team_name: team_project.team.name,
          project_name: team_project.project.name,
          action_link: if team_project.comments_for_team(current_user.student).empty? then "/survey/complete?id="+team_project.id.to_s else "/survey/view/id="+team_project.id.to_s end,
          action_text: if team_project.comments_for_team(current_user.student).empty? then "Complete" else "View" end,
          due: team_project.project.due.in_time_zone('Eastern Time (US & Canada)').strftime('%Y-%m-%d %I:%M:%S %p')
        }
      }
    end
  end
end
