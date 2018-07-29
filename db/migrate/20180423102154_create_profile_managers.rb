class CreateProfileManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_managers do |t|
      t.references :user, foreign_key: true
      t.references :address, foreign_key: true
      t.references :contact, foreign_key: true
      t.references :rank, foreign_key: true
      t.references :skill, foreign_key: true
      t.references :social, foreign_key: true

      t.timestamps
    end
  end
end
