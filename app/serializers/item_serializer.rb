class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :bought
end
