class UserAccount < ApplicationRecord
  belongs_to :merchant, optional: true
  belongs_to :client, optional: true
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
end
