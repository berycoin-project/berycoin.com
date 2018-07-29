class ChangeTypeOfBalanceToFloatInVests < ActiveRecord::Migration[5.0]
  def change
    change_column :vests, :balance, :float
  end
end
