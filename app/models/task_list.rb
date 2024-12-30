class TaskList < ApplicationRecord
  belongs_to :user, foreign_key: :users_id

  has_many :task_lists_statuses, dependent: :destroy
  has_many :statuses, through: :task_lists_statuses

  has_many :tasks, foreign_key: "task_lists_id", dependent: :destroy

  validates :name, presence: true

  def next_tasks
    tasks.order(due_date: :desc).limit(5)
  end

  # returns a mapping of status names to their respective tasks
  # if a status has no tasks, an empty array is used
  def tasks_per_status
    tasks_map = tasks.group_by { |task| task.status }
    self.statuses.each do |status|
      tasks_map[status.name] ||= []
    end
    tasks_map
  end
end
