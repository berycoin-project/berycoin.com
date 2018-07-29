class AddVerificationToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :verification, :boolean
  end
end
