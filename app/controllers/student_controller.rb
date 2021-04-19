# This controller allows a teacher to add a class roster to the database.
class StudentController < ApplicationController
  protect_from_forgery :except => :create

  # The GET request must render every one of the student's names
  def index
    render json: Student.all
  end

  # The POST request expects JSON with a value that can be made into a database record
  #  How to make a POST request : Response = await (await fetch(‘/controller/method_name’, {method: “POST”, data: json_object})).json()
  def create
    text_box = params[:text]
    arr = text_box.split("\n")
    arr.each do |element|
      new_student = element.split(',')
      name = new_student[0].split
      # old way: Student.create({ first: new_student[0], last: new_student[1].gsub(',', ''), email: new_student[2] })
      Student.create(first: name[0], last: name[1], email: new_student[1])
    end
  end
end
