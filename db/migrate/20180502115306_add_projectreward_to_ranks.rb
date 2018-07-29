class AddProjectrewardToRanks < ActiveRecord::Migration[5.0]
  def change
    add_column :ranks, :project_reward, :float
  end
end
