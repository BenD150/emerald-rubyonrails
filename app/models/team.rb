class Team < ApplicationRecord
    has_many :student_teams
    has_many :students, through: :student_teams

    has_many :team_projects
    has_many :projects, through: :team_projects

    belongs_to :course
end
