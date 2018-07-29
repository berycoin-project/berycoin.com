class AddRewardToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :reward, :float
  end
end
