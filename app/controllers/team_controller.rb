# This controller allows a teacher to add students to a team using a GET and POST request.
class TeamController < ApplicationController
  protect_from_forgery except: :create
  before_action :authenticate_user!
  
  # The GET request renders all the students in the current course
  def index
    unless current_user.instructor
      render :nothing => true, :status => :unauthorized
    end

    @students = $selected_course.students.collect{|student| {name: student.first + ' ' + student.last, student_id: student.id }}
  end

  # The POST request creates a team and then adds the selected students to it
  def create
    unless current_user.instructor
      render :nothing => true, :status => :unauthorized
    end
    
    # create team
    team = Team.create(name: params[:team_name], course: $selected_course)

    # add students to teams
    student_ids = params[:student_ids]
    student_ids.each do |student_id|
      StudentTeam.create(student_id: student_id, team: team)
    end

    render json: { success: true }
  end
end

