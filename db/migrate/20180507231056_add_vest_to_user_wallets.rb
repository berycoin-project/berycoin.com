class AddVestToUserWallets < ActiveRecord::Migration[5.0]
  def change
    add_reference :user_wallets, :vest, foreign_key: true
  end
end
