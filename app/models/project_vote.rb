class ProjectVote < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :user, optional: true
  belongs_to :vote, optional: true
end
