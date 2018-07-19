class Merchant < ApplicationRecord
  has_one :user_account
  has_many :items
  has_many :services
  has_many :clients, through: :items
  has_many :clients, through: :services
end
