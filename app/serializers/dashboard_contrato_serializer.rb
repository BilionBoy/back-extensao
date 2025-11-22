class DashboardContratoSerializer < ActiveModel::Serializer
  attributes :id, :cliente_nome, :data_entrega, :data_devolucao, :valor_total, :itens_alugados

  def cliente_nome
    object.g_cliente.nome
  end

  def valor_total
    object.g_contrato_itens.sum { |ci| ci.g_item.valor_diaria * ci.quantidade }
  end

  def itens_alugados
    object.g_contrato_itens.map do |ci|
      {
        item_descricao: ci.g_item.descricao,
        quantidade: ci.quantidade,
        valor_unitario: ci.g_item.valor_diaria
      }
    end
  end
end
