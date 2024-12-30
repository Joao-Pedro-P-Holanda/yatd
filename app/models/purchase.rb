class Purchase < ApplicationRecord
  belongs_to :user

  has_many :purchase_links, foreign_key: :purchases_id, dependent: :destroy

  def bought_price
    self.purchase_links.where(complete: true).sum(:value)
  end

  def total_price
    self.purchase_links.sum(:value)
  end

  def bought_count
    self.purchase_links.where(complete: true).count
  end

  def total_count
    self.purchase_links.count
  end
end
