class Item < ApplicationRecord
  belongs_to :merchant, optional: true
  belongs_to :client, optional: true
end
