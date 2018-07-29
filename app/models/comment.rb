class Comment < ApplicationRecord
  has_many :comment_managers
  has_many :users, through: :comment_managers, dependent: :destroy

  has_many :comment_managers
  has_many :articles, through: :comment_managers, dependent: :destroy

  has_many :comment_managers
  has_many :courses, through: :comment_managers, dependent: :destroy

  has_many :comment_managers
  has_many :projects, through: :comment_managers, dependent: :destroy

  has_many :reaction_managers
  has_many :reactions, through: :reaction_managers, dependent: :destroy
end
