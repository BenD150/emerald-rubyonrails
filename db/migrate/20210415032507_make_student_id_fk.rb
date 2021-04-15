class MakeStudentIdFk < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :users, :students
  end
end
