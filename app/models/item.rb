class Item < ApplicationRecord
  belongs_to :merchant
  belongs_to :client
end
