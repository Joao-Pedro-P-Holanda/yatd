class CreateTaskListsStatuses < ActiveRecord::Migration[8.0]
  def change
    create_table :task_lists_statuses do |t|
      t.belongs_to :task_list, null: false, foreign_key: true
      t.belongs_to :status, null: false, foreign_key: true
      t.timestamps
    end
  end
end
