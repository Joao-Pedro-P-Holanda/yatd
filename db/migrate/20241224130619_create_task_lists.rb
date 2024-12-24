class CreateTaskLists < ActiveRecord::Migration[8.0]
  def change
    create_table :task_lists do |t|
      t.string :name
      t.string :description

      t.references :users, foreign_key: true, null: false

      t.timestamps
    end
  end
end
