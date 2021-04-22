class FieldsOnInstructor < ActiveRecord::Migration[6.1]
  def change
    add_column :instructors, :first, :string
    add_column :instructors, :last, :string
    add_column :instructors, :email, :string
  end
end
