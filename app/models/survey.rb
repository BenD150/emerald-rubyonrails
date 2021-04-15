class Survey < ApplicationRecord
  belongs_to :student
  alias_attribute :written_by, :student

  belongs_to :team_project
  has_one :project, through: :team_project
  has_one :team, through: :team_project

  has_many :comments

  has_many :scores
end
