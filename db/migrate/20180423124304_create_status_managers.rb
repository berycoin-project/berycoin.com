class CreateStatusManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :status_managers do |t|
      t.references :user
      t.references :status
      t.references :project
      t.references :article
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
