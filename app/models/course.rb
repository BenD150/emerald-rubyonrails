class Course < ApplicationRecord
    has_many :course_instructors
    has_many :instructors, through: :course_instructors

    has_many :course_students
    has_many :students, through: :course_students

    has_many :teams
    has_many :projects
end
