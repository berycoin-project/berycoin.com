class RenameRankrewardToArticlerewardInRanks < ActiveRecord::Migration[5.0]
  def change
    rename_column :ranks, :rank_reward, :article_reward
  end
end
