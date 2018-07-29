class CreateWallets < ActiveRecord::Migration[5.0]
  def change
    create_table :wallets do |t|
      t.string :label
      t.string :address
      t.float :balance

      t.timestamps
    end
  end
end
