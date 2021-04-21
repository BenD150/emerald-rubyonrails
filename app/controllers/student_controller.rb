# This controller allows a teacher to add a class roster to the database.
class StudentController < ApplicationController
  protect_from_forgery except: :create
  # The GET request must render every one of the student's names
  def index
    @students = Student.all
  end

  # The POST request expects JSON with a value that can be made into a database record
  #  How to make a POST request : Response = await (await fetch(‘/controller/method_name’, {method: “POST”, data: json_object})).json()
  def create
    text_box = params[:text].to_s
    arr = text_box.split("\n")
    arr.each do |element|
      new_student = element.split(',')
      name = new_student[0].split
      Student.create(first: name[0], last: name[1], email: new_student[1])
    end
    render json: { success: true }
  end
end
