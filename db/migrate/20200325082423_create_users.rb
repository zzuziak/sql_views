class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address
      t.integer :social_security_number
      t.string :IBAN
      t.string :phone
      t.string :gender
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
