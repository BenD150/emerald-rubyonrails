class Student < ApplicationRecord
  belongs_to :user, required: false

  has_many :student_teams
  has_many :teams, through: :student_teams

  has_many :team_projects, through: :teams
  has_many :projects, through: :team_projects

  has_many :course_students
  has_many :courses, through: :course_students
end
