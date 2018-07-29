class Wallet < ApplicationRecord
  has_many :user_wallets
  has_many :users, through: :user_wallets, dependent: :destroy
end
