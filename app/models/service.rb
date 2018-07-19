class Service < ApplicationRecord
  belongs_to :merchant, optional: true
  belongs_to :client, optional: true
  scope :most_recent, -> { order("services.updated_at DESC") }
  scope :oldest, -> { order("services.updated_at ASC") }
  scope :available, -> { where(completed: false) }
end
