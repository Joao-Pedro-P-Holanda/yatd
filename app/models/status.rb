class Status < ApplicationRecord
  has_many :task_statuses
  has_many :tasks_lists, through: :task_lists_statuses
end
