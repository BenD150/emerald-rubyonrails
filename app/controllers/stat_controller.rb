# This controller renders all of the statistics for each project using only a GET request.
class StatController < ApplicationController
  include SurveyHelper
  before_action :authenticate_user!
  before_action :select_course!

  # The GET request renders the stats for each project in the currently selected course
  def index
    unless current_user.instructor
      render :nothing => true, :status => :unauthorized
    end

    teams = $selected_course.teams
    @data = {}

    # for each team...
    teams.each do |team|
      @data[team.id] = {name: team.name, students: {}}

      students_on_team = team.students

      # for each student on that team...
      students_on_team.each do |student_on_team|
        @data[team.id][:students][student_on_team.id] = {name: student_on_team.first + ' ' + student_on_team.last, survey_results: []}
        
        team_projects_for_student_on_team = team.team_projects

        # for each survey that a student on that team filled out...
        team_projects_for_student_on_team.each do |team_project_for_student_on_team|
          # aggregate the survey data, and add under the team id -> student id -> survey results
          @data[team.id][:students][student_on_team.id][:survey_results].push(survey_result(team_project_for_student_on_team, student_on_team))
        end
      end
    end
  end
end
