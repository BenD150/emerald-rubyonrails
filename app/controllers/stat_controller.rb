# This controller renders all of the statistics for each project using only a GET request.
class StatController < ApplicationController
  # The GET request must render the stats for each project
  def get_stats
    students = Student.all
    result = []
    students.each do |student|
      student_result = {name: student.first + " " + student.last, id: student.id, survey_results: []}
      projects = student.projects
      projects.each do |project|
        survey_result = {project_name: project.name, comments: []}
        surveys = project.surveys
        surveys.each do |survey|
          
        end
        student_result[:survey_results].push(survey_result)
      end
    end
  end
end
