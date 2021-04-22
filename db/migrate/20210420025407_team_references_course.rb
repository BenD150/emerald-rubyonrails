class TeamReferencesCourse < ActiveRecord::Migration[6.1]
  def change
    add_reference :teams, :course, foreign_key: true
  end
end
