class Category < ApplicationRecord
  has_many :category_managers
  has_many :users, through: :category_managers, dependent: :destroy

  has_many :category_managers
  has_many :articles, through: :category_managers, dependent: :destroy

  has_many :category_managers
  has_many :courses, through: :category_managers, dependent: :destroy

  has_many :category_managers
  has_many :projects, through: :category_managers, dependent: :destroy
end
