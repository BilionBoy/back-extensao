# frozen_string_literal: true

class GContratoSerializer < ActiveModel::Serializer
  attributes :id, :data_entrega, :data_devolucao, :observacoes, :valor_total

  belongs_to :g_cliente
  belongs_to :g_status_pagamento
  belongs_to :g_forma_pagamento
  has_many   :g_contrato_itens

  # ✅ NOVO
  def valor_total
    object.valor_total
  end
end
