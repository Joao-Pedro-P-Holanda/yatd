class Status < ApplicationRecord
  has_many :task_statuses
  has_many :tasks_lists, through: :task_lists_statuses

  validates :name, presence: true

  # String starting with # containing either 6 or 3 valid hexadecimal digits
  hex_regex = /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/
  validates :color, presence: true, format: { with: hex_regex, message: "Cor deve ser um código hexadecimal válido" }
end
