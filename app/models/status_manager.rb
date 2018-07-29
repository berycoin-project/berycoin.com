class StatusManager < ApplicationRecord
  belongs_to :course, optional: true
  belongs_to :project, optional: true
  belongs_to :user, optional: true
  belongs_to :article, optional: true
  belongs_to :status, optional: true
end
