class CategoryManager < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :article, optional: true
  belongs_to :course, optional: true
  belongs_to :user, optional: true
  belongs_to :project, optional: true
end
