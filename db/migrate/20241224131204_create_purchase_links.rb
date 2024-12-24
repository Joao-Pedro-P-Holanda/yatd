class CreatePurchaseLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :purchase_links do |t|
      t.boolean :complete
      t.float :value
      t.string :url

      t.references :purchases, foreign_key: true, null: false

      t.timestamps
    end
  end
end
