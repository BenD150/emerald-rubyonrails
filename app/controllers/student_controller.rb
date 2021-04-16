# This controller allows a teacher to add a class roster to the database.
class StudentController < ApplicationController

  # The GET request must render every one of the student's names
  def get_students
    @students = Student.all
  end

  # The POST request expects JSON with a value that can be made into a database record
  #  How to make a POST request : Response = await (await fetch(‘/controller/method_name’, {method: “POST”, data: json_object})).json()

end
