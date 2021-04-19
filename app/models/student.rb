class Student < ApplicationRecord
  has_one :user

  has_many :student_teams
  has_many :teams, through: :student_teams

  has_many :team_projects, through: :teams
  has_many :projects, through: :team_projects
end
