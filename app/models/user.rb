class User < ApplicationRecord
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :task_lists, foreign_key: :users_id, dependent: :destroy
  has_many :purchases, foreign_key: :users_id, dependent: :destroy
end
