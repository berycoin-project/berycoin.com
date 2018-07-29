class CommentManager < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :user, optional: true
  belongs_to :article, optional: true
  belongs_to :comment, optional: true
  belongs_to :course, optional: true
end
