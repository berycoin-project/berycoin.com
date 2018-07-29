class Reaction < ApplicationRecord
  has_many :reaction_managers
  has_many :users, through: :reaction_managers, dependent: :destroy

  has_many :reaction_managers
  has_many :projects, through: :reaction_managers, dependent: :destroy

  has_many :reaction_managers
  has_many :courses, through: :reaction_managers, dependent: :destroy

  has_many :reaction_managers
  has_many :comments, through: :reaction_managers, dependent: :destroy

  has_many :reaction_managers
  has_many :articles, through: :reaction_managers, dependent: :destroy
end
