class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :bought
  belongs_to :merchant
end
