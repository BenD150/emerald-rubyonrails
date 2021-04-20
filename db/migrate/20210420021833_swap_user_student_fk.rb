class SwapUserStudentFk < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :student_id
    add_reference :students, :user, null: true, foreign_key: true
  end
end
