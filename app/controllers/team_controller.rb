# This controller allows a teacher to add students to a team using a GET and POST request.
class TeamController < ApplicationController
  protect_from_forgery except: :create

  # The GET request must render every one of the student's names
  def index
    render json: Student.all
  end

  # The POST request expects JSON with a value that can be made into a new database record.
  def create
    team = Team.create(name: params[:name])
    student_ids = params[:student_ids]
    student_ids.each do |student_id|
      StudentTeam.create(student_id: student_id, team: team)
    end
  end
end

