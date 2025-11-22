# frozen_string_literal: true

module Api
  module V1
    class GContratosController < ApplicationController
      include JsonResponse
      include PagyPagination

      before_action :set_g_contrato, only: [ :show, :update, :destroy ]

      def index
        query = GContrato.includes(
          :g_cliente,
          :g_status_pagamento,
          :g_forma_pagamento,
          g_contrato_itens: :g_item
        ).ransack(params[:q])

        result = paginate(query.result.order(:id), params[:per_page])

        render_success(
          data: ActiveModelSerializers::SerializableResource.new(
            result[:items],
            each_serializer: GContratoSerializer
          ),
          message: "GContratos listados com sucesso"
        )
      end

      def show
        render_success(
          data: GContratoSerializer.new(@g_contrato),
          message: "GContrato encontrado com sucesso"
        )
      end

      def create
        contrato = GContrato.new(g_contrato_params)

        if contrato.save
          render_success(
            data: GContratoSerializer.new(contrato),
            message: "GContrato criado com sucesso",
            status: :created
          )
        else
          render_error(
            message: "Erro ao criar GContrato",
            errors: contrato.errors.full_messages
          )
        end
      end

      def update
        if @g_contrato.update(g_contrato_params)
          render_success(
            data: GContratoSerializer.new(@g_contrato),
            message: "GContrato atualizado com sucesso"
          )
        else
          render_error(
            message: "Erro ao atualizar GContrato",
            errors: @g_contrato.errors.full_messages
          )
        end
      end

      def destroy
        @g_contrato.destroy
        render_success(message: "GContrato removido com sucesso")
      end

      private

      def set_g_contrato
        @g_contrato = GContrato.includes(
          g_contrato_itens: :g_item
        ).find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render_error(message: "Registro não encontrado", status: :not_found)
      end

      def g_contrato_params
        params.require(:g_contrato).permit(
          :data_entrega,
          :data_devolucao,
          :observacoes,
          :g_cliente_id,
          :g_status_pagamento_id,
          :g_forma_pagamento_id,
          g_contrato_itens_attributes: [ :g_item_id, :quantidade ]
        )
      end
    end
  end
end
