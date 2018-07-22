class Item < ApplicationRecord
  belongs_to :merchant, optional: true
  belongs_to :client, optional: true
  validates :name, presence: true
  validates :description, presence: true
  scope :most_recent, -> { order("items.updated_at DESC") }
  scope :oldest, -> { order("items.updated_at ASC") }
  scope :available, -> { where(bought: false) }
end
