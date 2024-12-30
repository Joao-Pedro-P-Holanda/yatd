class TaskListsStatus < ApplicationRecord
  belongs_to :task_list
  belongs_to :status
end
