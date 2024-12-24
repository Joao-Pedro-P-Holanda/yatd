class CreateTaskChecks < ActiveRecord::Migration[8.0]
  def change
    create_table :task_checks do |t|
      t.string :description
      t.boolean :complete

      t.references :tasks, foreign_key: true, null: false

      t.timestamps
    end
  end
end
