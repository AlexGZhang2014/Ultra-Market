class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :bought, :completed
  belongs_to :merchant
end
