class TaskList < ApplicationRecord
  belongs_to :user, foreign_key: :users_id

  has_many :task_lists_statuses
  has_many :statuses, through: :task_lists_statuses

  has_many :tasks, foreign_key: "task_lists_id", dependent: :destroy

  validates :name, presence: true

  # every task should have a name
  def reject_tasks(attributes)
    attributes["name"].blank?
  end

  def next_tasks
    tasks.order(due_date: :desc).limit(5)
  end
end
