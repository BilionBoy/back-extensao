class GContratoItem < ApplicationRecord
  self.table_name = "g_contratos_itens"

  belongs_to :g_contrato, optional: true
  belongs_to :g_item

  validates :quantidade, presence: true
end
