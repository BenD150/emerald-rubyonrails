# This controller deals with the evaluation surveys
class SurveyController < ApplicationController
  include SurveyHelper
  protect_from_forgery except: :create
  before_action :authenticate_user!

  # The GET request renders the names of the teammates of the authenticated user
  def complete
    unless current_user.student
      render :nothing => true, :status => :unauthorized
    end

    current_user.student
    team_project = TeamProject.where(id: params[:id]).first
    students = team_project.team.students
    @students = students.collect{|student| {id: student.id, name: student.first + ' ' + student.last}}

    @data = {team_project_id: team_project.id, completed_survey: students.collect{|student| {student_id: student.id, comment: nil, score: nil}}}.to_json
  end

  # The POST request creates the survey filled out by the student
  def create
    unless current_user.student
      render :nothing => true, :status => :unauthorized
    end

    team_project = TeamProject.where(id: params[:team_project_id]).first
    puts current_user.student.first
    puts params
    survey = Survey.create(team_project: team_project,written_by: current_user.student)
    params[:completed_survey].each do |item|
      written_for = Student.where(id: item[:student_id]).first
      Comment.create(text: item[:comment],survey: survey,written_for: written_for)
      Score.create(value: item[:score],survey: survey,written_for: written_for)
    end

    render json: { success: true }
  end

  # The GET request renders the results of this particular survey
  def view
    unless current_user.student
      render :nothing => true, :status => :unauthorized
    end

    team_project = TeamProject.where(id: params[:id]).first
    @survey = survey_result(team_project, current_user.student)
    @survey[:team_name] = team_project.team.name
  end
end
