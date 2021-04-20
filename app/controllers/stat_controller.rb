# This controller renders all of the statistics for each project using only a GET request.
class StatController < ApplicationController
  include SurveyHelper

  # The GET request must render the stats for each project
  def index
    students = Student.all
    student_results = []
    students.each do |student|
      survey_results = []
      team_projects = student.team_projects
      team_projects.each do |team_project|
        survey_results.push(survey_result(team_project, student))
      end
      student_result = {name: student.first + " " + student.last, id: student.id, survey_results: survey_results}
      student_results.push(student_result)
    end
  end
  # TODO render page with student_results object as a json variable
  
end
