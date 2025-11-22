class GContratoItemSerializer < ActiveModel::Serializer
  attributes :id, :quantidade

  belongs_to :g_item
end
