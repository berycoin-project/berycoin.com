class AddPinToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :pin, :string
  end
end
