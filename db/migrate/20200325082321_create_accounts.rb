class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :account_type
      t.integer :discount
      t.boolean :priority_shipping
      t.boolean :domestic

      t.timestamps
    end
  end
end
