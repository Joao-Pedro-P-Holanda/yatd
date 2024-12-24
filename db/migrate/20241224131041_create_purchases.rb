class CreatePurchases < ActiveRecord::Migration[8.0]
  def change
    create_table :purchases do |t|
      t.string :name
      t.string :description
      t.datetime :due_date

      t.references :users, foreign_key: true, null: false

      t.timestamps
    end
  end
end
