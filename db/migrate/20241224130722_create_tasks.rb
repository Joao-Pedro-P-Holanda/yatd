class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.integer :priority
      t.datetime :due_date

      t.references :task_lists, foreign_key: true, null: false

      t.timestamps
    end
  end
end
