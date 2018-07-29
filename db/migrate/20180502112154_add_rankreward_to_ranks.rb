class AddRankrewardToRanks < ActiveRecord::Migration[5.0]
  def change
    add_column :ranks, :rank_reward, :float
  end
end
