class Vest < ApplicationRecord
  has_many :user_wallets
  has_many :users, through: :user_wallets
end
