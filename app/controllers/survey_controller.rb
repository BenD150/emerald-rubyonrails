# This controller deals with the evaluation surveys
class SurveyController < ApplicationController
  # The GET request must render the names of the teammates of the signed in user
  @user = current_user.student
  @team = StudentTeam.where(name: @user)

  # The POST request lists the survey results which is a comment and a number
  def results
    @comments = Comment.all
    @scores = Score.all
  end

end
