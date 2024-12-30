class ChangeDueDateToDateOnPurchases < ActiveRecord::Migration[8.0]
  def up
    change_column :purchases, :due_date, :date
  end

  def down
    change_column :purchases, :due_date, :datetime
  end
end
