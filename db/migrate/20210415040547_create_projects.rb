class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.references :team, null: false, foreign_key: true
      t.datetime :due

      t.timestamps
    end
  end
end
