# frozen_string_literal: true

class GContratoSerializer < ActiveModel::Serializer
  attributes :id, :data_entrega, :data_devolucao, :observacoes

  belongs_to :g_cliente
  belongs_to :g_status_pagamento
  belongs_to :g_forma_pagamento
  has_many   :g_contrato_itens
end
