# This controller deals with the evaluation surveys
class SurveyController < ApplicationController
  # The GET request must render the names of the teammates of the signed in user
  def index
    if user_signed_in?
      user = current_user
      student = user.student_id
    end
  end



  # The POST request lists the survey results which is a comment and a number
  # See survye controller
  # Comment and score object linked to the survey and the student
  # A team has multiple projects. Each project has multiple sryvets. The survey has the ID of the survey and the student that is writing it. Each survey has a list of comments and scores. The writer of the survey ID
  # is on the su,
  def results
    survey =
  end

end
