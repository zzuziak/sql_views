class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :sku
      t.string :name
      t.integer :price
      t.float :margin

      t.timestamps
    end
  end
end
