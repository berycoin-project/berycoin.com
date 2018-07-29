class CreateUserWallets < ActiveRecord::Migration[5.0]
  def change
    create_table :user_wallets do |t|
      t.references :user, foreign_key: true
      t.references :wallet, foreign_key: true

      t.timestamps
    end
  end
end
