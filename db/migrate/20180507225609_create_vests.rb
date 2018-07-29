class CreateVests < ActiveRecord::Migration[5.0]
  def change
    create_table :vests do |t|
      t.string :name
      t.string :balance

      t.timestamps
    end
  end
end
