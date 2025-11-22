# frozen_string_literal: true

class GContrato < ApplicationRecord
  belongs_to :g_cliente
  belongs_to :g_status_pagamento
  belongs_to :g_forma_pagamento

  has_many :g_contrato_itens,
           class_name: "GContratoItem",
           foreign_key: "g_contrato_id",
           dependent: :destroy

  has_many :g_itens, through: :g_contrato_itens

  accepts_nested_attributes_for :g_contrato_itens, allow_destroy: true
end
