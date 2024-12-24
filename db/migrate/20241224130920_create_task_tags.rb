class CreateTaskTags < ActiveRecord::Migration[8.0]
  def change
    create_table :task_tags do |t|
      t.string :name
      t.string :color

      t.references :tasks, foreign_key: true, null: false

      t.timestamps
    end
  end
end
