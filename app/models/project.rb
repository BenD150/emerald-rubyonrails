class Project < ApplicationRecord
  has_many :team_projects
  has_many :teams, through: :team_projects

  has_many :surveys, through: :team_projects

  belongs_to :course
end
