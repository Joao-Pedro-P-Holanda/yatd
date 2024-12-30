class TaskTag < ApplicationRecord
  hex_regex = /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/
  validates :color, presence: true, format: { with: hex_regex, message: "Cor deve ser um código hexadecimal válido" }
end
