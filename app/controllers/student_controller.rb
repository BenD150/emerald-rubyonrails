# This controller allows a teacher to add a class roster to the database.
class StudentController < ApplicationController
  protect_from_forgery except: :create
  before_action :authenticate_user!

  # The GET request serves a static page to input a student roster
  def index
    unless current_user.instructor
      render :nothing => true, :status => :unauthorized
    end
  end

  # The POST request creates students (if they don't exist) and adds them to the currently selected course
  def create
    unless current_user.instructor
      render :nothing => true, :status => :unauthorized
    end

    text_box = params[:text].to_s
    lines = text_box.split("\n")
    lines.each do |line|
      # parse student info
      student_info = line.split(',')
      email = student_info[1]
      name = student_info[0].split
      first = name[0]
      last = name[1]

      student = Student.where(email: email).first

      # if student doesn't exist, create
      unless student
        student = tudent.create(first: first, last: last, email: email)
      end

      # match student with current course
      CourseStudent.create(course: $selected_course, student: student)
    end

    render json: { success: true }
  end
end
