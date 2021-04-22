module SurveyHelper
	def survey_result(team_project, student)
		comments = team_project.comments_from_team(student).collect{|comment_record| comment_record.text}
		score_for_self = team_project.score_for_self(student).value
		average_score_from_teammates = team_project.scores_from_team(student).collect{|score_record| score_record.value}.inject(0){|sum, v| sum + v }
		survey_result = {project_name: team_project.project.name, score_for_self: score_for_self, average_score_from_teammates: average_score_from_teammates, comments: comments}
	end
end