class Client < ApplicationRecord
  has_one :user_account
  has_many :items
  has_many :services
  has_many :merchants, through: :items
  has_many :merchants, through: :services
  validates :name, presence: true
end
