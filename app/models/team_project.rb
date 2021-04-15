class TeamProject < ApplicationRecord
  belongs_to :team
  belongs_to :project

  has_many :surveys
end
