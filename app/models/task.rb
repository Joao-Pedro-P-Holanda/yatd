class Task < ApplicationRecord
  has_many :task_statuses
  has_many :statuses, through: :task_statuses

  belongs_to :task_list, foreign_key: "task_lists_id", optional: false

  validates :name, presence: true
  validates :priority, presence: true
  validates :due_date, presence: true
  validates :status, presence: true
end
