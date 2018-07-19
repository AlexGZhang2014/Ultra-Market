class Item < ApplicationRecord
  belongs_to :merchant, optional: true
  belongs_to :client, optional: true
  validates :quantity, numericality: {greater_than_or_equal_to: 0}
end
