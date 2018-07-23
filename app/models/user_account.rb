class UserAccount < ApplicationRecord
  belongs_to :merchant, optional: true
  belongs_to :client, optional: true
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.password = auth["credentials"]["token"]
    end
  end
end
