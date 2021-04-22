# This controller renders all of the statistics for each project using only a GET request.
class StatController < ApplicationController
  include SurveyHelper
  before_action :authenticate_user!

  # The GET request renders the stats for each project in the currently selected course
  def index
    unless current_user.instructor
      render :nothing => true, :status => :unauthorized
    end

    students = $selected_course.students
    @student_results = []
    students.each do |student|
      survey_results = []
      team_projects = student.team_projects
      team_projects.each do |team_project|
        survey_results.push(survey_result(team_project, student))
      end
      student_result = {name: student.first + " " + student.last, id: student.id, survey_results: survey_results}
      @student_results.push(student_result)
    end
  end
end
