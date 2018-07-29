class Status < ApplicationRecord
  has_many :status_managers
  has_many :articles, through: :status_managers, dependent: :destroy

  has_many :status_managers
  has_many :users, through: :status_managers, dependent: :destroy

  has_many :status_managers
  has_many :projects, through: :status_managers, dependent: :destroy

  has_many :status_managers
  has_many :courses, through: :status_managers, dependent: :destroy
end
