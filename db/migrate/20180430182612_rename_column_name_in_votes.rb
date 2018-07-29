class RenameColumnNameInVotes < ActiveRecord::Migration[5.0]
  def change
    rename_column :votes, :type, :vote_type
  end
end
