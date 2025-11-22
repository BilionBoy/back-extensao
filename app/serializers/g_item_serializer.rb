# frozen_string_literal: true

class GItemSerializer < ActiveModel::Serializer
  attributes :id,
             :descricao,
             :valor_diaria,
             :valor_semanal,
             :valor_mensal,
             :ativo
end
