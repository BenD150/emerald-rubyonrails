# This controller allows a teacher to add a class roster to the database.
class StudentController < ApplicationController
  protect_from_forgery except: :create
  before_action :authenticate_user!
  before_action :select_course!

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
      begin
        # parse student info
        student_info = line.split(',')
        email = student_info[1]
        name = student_info[0].split
        first = name[0]
        last = name[1]
        is_instructor = student_info[2] == "Instructor"
        puts "******************************************************************"
        puts student_info
        puts is_instructor
        student = Student.where(email: email).first
        instructor = Instructor.where(email: email).first
        user = User.where(email: email).first

        # if instructor doesn't exist, create
        if is_instructor && !instructor
          if user
            # if corresponding user exists, reference this new instructor
            instructor = Instructor.create(email: email, user: user)
          else
            # otherwise, assume we will add the user reference later when the user is created
            instructor = Instructor.create(email: email)
          end

        # if student doesn't exist, create
        elsif !student
          if user
            # if corresponding user exists, reference this new student
            student = Student.create(first: first, last: last, email: email, user: user)
          else
            # otherwise, assume we will add the user reference later when the user is created
            student = Student.create(first: first, last: last, email: email)
          end

        end

        if is_instructor
          # match instructor with current course
          CourseInstructor.create(course: $selected_course, instructor: instructor)
        else
          # match student with current course
          CourseStudent.create(course: $selected_course, student: student)
        end
      rescue
        puts "Failed to parse line: " + line.to_str
      end
    end

    render json: { success: true }
  end
end
