class Task < ApplicationRecord
  has_many :project_tasks
  has_many :projects, through: :project_tasks, dependent: :destroy

  has_many :project_tasks
  has_many :users, through: :project_tasks, dependent: :destroy
end
