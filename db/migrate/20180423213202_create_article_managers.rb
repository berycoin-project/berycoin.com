class CreateArticleManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :article_managers do |t|
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true
      t.references :course, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
