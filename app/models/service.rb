class Service < ApplicationRecord
  belongs_to :merchant
  belongs_to :client
end
