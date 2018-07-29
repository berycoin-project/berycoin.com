class Rank < ApplicationRecord
  has_many :profile_managers
  has_many :users, through: :profile_managers
end
