class ChangeTypeToBeStringInVotes < ActiveRecord::Migration[5.0]
  def change
    change_column :votes, :type, :string
  end
end
