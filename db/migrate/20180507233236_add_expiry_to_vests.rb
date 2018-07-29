class AddExpiryToVests < ActiveRecord::Migration[5.0]
  def change
    add_column :vests, :expire_at, :datetime
  end
end
