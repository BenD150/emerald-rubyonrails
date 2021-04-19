# This controller renders all of the statistics for each project using only a GET request.
class StatController < ApplicationController
  # The GET request must render the stats for each project
  def get_stats
    students = Student.all
    student_results = []
    students.each do |student|
      survey_results = []
      team_projects = student.team_projects
      team_projects.each do |team_project|
        comments = team_project.comments_from_team(student).collect{|comment_record| comment_record.text}
        score_for_self = team_project.score_for_self(student).value
        average_score_from_teammates = team_project.scores_from_team(student).collect{|score_record| score_record.value}.inject(0){|sum, v| sum + v }
        survey_result = {project_name: team_project.project.name, score_for_self: score_for_self, average_score_from_teammates: average_score_from_teammates, comments: comments}
        survey_results.push(survey_result)
      end
      student_result = {name: student.first + " " + student.last, id: student.id, survey_results: survey_results}
      student_results.push(student_result)
    end
  end
  # TODO render page with student_results object as a json variable
end
