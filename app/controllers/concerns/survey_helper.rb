module SurveyHelper
	def survey_result(team_project, student)
		score_for_self = begin team_project.score_for_self(student).value rescue 'Incomplete' end

		comments = begin team_project.comments_from_team(student).collect{|comment_record| comment_record.text} rescue ['No comments for this student yet'] end
		if comments.length == 0
			comments = ['No comments for this student yet']
		end

		average_score_from_teammates = begin team_project.scores_from_team(student).collect{|score_record| score_record.value}.inject(0){|sum, v| sum + v } rescue 'No scores for this student yet' end
		if average_score_from_teammates == 0
			average_score_from_teammates = 'No scores for this student yet'
		end

		survey_result = {project_name: team_project.project.name, score_for_self: score_for_self, average_score_from_teammates: average_score_from_teammates, comments: comments}
	end
end