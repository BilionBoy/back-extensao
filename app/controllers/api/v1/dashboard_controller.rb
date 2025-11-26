# frozen_string_literal: true

module Api
  module V1
    class DashboardController < ApplicationController
      include JsonResponse
      include PagyPagination

      def index
        # Total de contratos do mês
        total_do_mes = GContrato.where(
          data_entrega: Time.current.beginning_of_month..Time.current.end_of_month
        ).count

        # Contratos pendentes
        pendentes = GContrato
          .joins(:g_status_pagamento)
          .where(g_status_pagamentos: { descricao: "Pendente" })
          .count

        # Contratos pagos
        pagos = GContrato
          .joins(:g_status_pagamento)
          .where(g_status_pagamentos: { descricao: "Pago" })
          .count

        # Valor a receber (pendentes)
        a_receber = GContrato
          .joins(g_contrato_itens: :g_item)
          .joins(:g_status_pagamento)
          .where(g_status_pagamentos: { descricao: "Pendente" })
          .sum("COALESCE(g_itens.valor_diaria, 0) * COALESCE(g_contratos_itens.quantidade, 0)")

        # Próximas entregas
        proximas_entregas = GContrato
          .joins(:g_status_pagamento)
          .includes(:g_cliente, g_contrato_itens: :g_item)
          .where("g_contratos.data_entrega >= ?", Time.current)
          .where(g_status_pagamentos: { descricao: "Pendente" })
          .order(:data_entrega)
          .limit(5)

        render_success(
          data: {
            total_mes: total_do_mes,
            pendentes: pendentes,
            pagos: pagos,
            a_receber: a_receber,
            proximas_entregas: ActiveModelSerializers::SerializableResource.new(
              proximas_entregas,
              each_serializer: DashboardContratoSerializer
            )
          },
          message: "Dashboard carregado com sucesso"
        )
      end
    end
  end
end
