# This controller allows a teacher to add a class roster to the database.
class StudentController < ApplicationController

  # The GET request must render every one of the student's names
  def get_students
    @students = Student.all
  end

  # The POST request expects JSON with a value that can be made into a database record
  #  How to make a POST request : Response = await (await fetch(‘/controller/method_name’, {method: “POST”, data: json_object})).json()
  def create
    roster = 'public/class_roster.txt'
    File.readlines(roster).each do |line|
      new_student = line.split
      @student = Student.create(first: new_student[0], last: new_student[1].gsub(',', ''), email: new_student[2])
    end
  end
end
