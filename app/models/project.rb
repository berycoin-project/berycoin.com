class Project < ApplicationRecord
  has_many :project_tasks
  has_many :tasks, through: :project_tasks, dependent: :destroy

  has_many :user_projects
  has_many :users, through: :user_projects, dependent: :destroy

  has_many :project_votes
  has_many :votes, through: :project_votes, dependent: :destroy

  has_many :status_managers
  has_many :statuses, through: :status_managers, dependent: :destroy

  has_many :article_managers
  has_many :courses, through: :article_managers, dependent: :destroy

  has_many :comment_managers
  has_many :comments, through: :comment_managers, dependent: :destroy

  has_many :article_managers
  has_many :articles, through: :article_managers, dependent: :destroy

  has_many :category_managers
  has_many :categories, through: :category_managers, dependent: :destroy

  has_many :reaction_managers
  has_many :reactions, through: :reaction_managers, dependent: :destroy
end
