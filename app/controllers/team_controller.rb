# This controller allows a teacher to add students to a team using a GET and POST request.
class TeamController < ApplicationController

  # The GET request must render every one of the student's names
  def get_students
    @students = Student.all
  end

  # The POST request expects JSON with a value that can be made into a new database record.
  def create
    @team = Team.create(params[:name])
    render json: @team

    @students.each do |student|
      @student_team = StudentTeam.create(student: student, team: params[:team])
    end
    render json: @student_team
  end
end

