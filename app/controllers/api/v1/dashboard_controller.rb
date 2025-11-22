# app/controllers/api/v1/dashboard_controller.rb
# frozen_string_literal: true

module Api
  module V1
    class DashboardController < ApplicationController
      include JsonResponse
      include PagyPagination

      # GET /api/v1/dashboard
      def index
        # Total de contratos do mês
        total_do_mes = GContrato.where(
          data_entrega: Time.current.beginning_of_month..Time.current.end_of_month
        ).count

        # Contratos pendentes (ex: status pendente)
        pendentes = GContrato.joins(:g_status_pagamento)
                             .where(g_status_pagamentos: { descricao: "Pendente" })
                             .count

        # Contratos pagos (ex: status pago)
        pagos = GContrato.joins(:g_status_pagamento)
                         .where(g_status_pagamentos: { descricao: "Pago" })
                         .count

        # Valor a receber (soma dos valores de contratos pendentes)
        a_receber = GContrato.joins(g_contrato_itens: :g_item)
                             .joins(:g_status_pagamento)
                             .where(g_status_pagamentos: { descricao: "Pendente" })
                             .sum("g_itens.valor_diaria * g_contratos_itens.quantidade")

        # Próximas entregas
        proximas_entregas = GContrato.includes(:g_cliente, g_contrato_itens: :g_item)
                                     .where("data_entrega >= ?", Time.current)
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
