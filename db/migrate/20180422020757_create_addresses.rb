class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.text :street
      t.string :country
      t.string :city
      t.integer :zip

      t.timestamps
    end
  end
end
