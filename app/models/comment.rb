class Comment < ApplicationRecord
  belongs_to :student
  alias_attribute :written_for, :student

  belongs_to :survey
end
