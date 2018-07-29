class AddAttachmentArticleCoverToArticles < ActiveRecord::Migration[5.0]
  def self.up
    change_table :articles do |t|
      t.attachment :article_cover
    end
  end

  def self.down
    remove_attachment :articles, :article_cover
  end
end
