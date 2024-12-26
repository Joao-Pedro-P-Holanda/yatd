class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: nil
      t.string :email, null: false, default: nil
      t.string :encrypted_password, null: false, default: ""


      t.timestamps
    end
  end
end
