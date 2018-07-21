class Item < ApplicationRecord
  belongs_to :merchant, optional: true
  belongs_to :client, optional: true
  validates :name, presence: true
  validates :description, presence: true
  #validates :quantity, numericality: {greater_than_or_equal_to: 0}
  validates_numericality_of :quantity, :only_integer => true, :greater_than_or_equal_to => 0
  scope :most_recent, -> { order("items.updated_at DESC") }
  scope :oldest, -> { order("items.updated_at ASC") }
  scope :available, -> { where("items.quantity > ?", 0) }
end
