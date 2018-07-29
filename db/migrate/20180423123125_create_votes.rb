class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.float :weight
      t.boolean :type
      t.text :description

      t.timestamps
    end
  end
end
