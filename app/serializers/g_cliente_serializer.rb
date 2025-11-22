# frozen_string_literal: true

class GClienteSerializer < ActiveModel::Serializer
  attributes :id,
             :nome,
             :telefone,
             :cpf,
             :rg,
             :data_nascimento,
             :endereco_residencial,
             :local_entrega

  belongs_to :g_bairro
end
