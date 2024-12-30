class PurchaseLink < ApplicationRecord
  belongs_to :purchase, foreign_key: :purchases_id, optional: false

  validates :url, url: true
  validates :value, presence: true
end
