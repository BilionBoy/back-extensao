# frozen_string_literal: true

module Api
  module V1
    class GStatusPagamentosController < ApplicationController
      include JsonResponse
      include PagyPagination
      before_action :set_g_status_pagamento, only: [ :show, :update, :destroy ]

      def index
        query  = GStatusPagamento.ransack(params[:q])
        result = paginate(query.result.order(:id), params[:per_page])

        render_success(
          data: result,
          message: "GStatusPagamentos listados com sucesso"
        )
      end

      def show
        render json: @g_status_pagamento
      end

      def create
        @g_status_pagamento = GStatusPagamento.new(g_status_pagamento_params)

        if @g_status_pagamento.save
          render json: @g_status_pagamento, status: :created
        else
          render json: @g_status_pagamento.errors, status: :unprocessable_entity
        end
      end

      def update
        if @g_status_pagamento.update(g_status_pagamento_params)
          render json: @g_status_pagamento
        else
          render json: @g_status_pagamento.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @g_status_pagamento.destroy
        head :no_content
      end

      private

      def set_g_status_pagamento
        @g_status_pagamento = GStatusPagamento.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Not found" }, status: :not_found
      end

      def g_status_pagamento_params
        params.require(:g_status_pagamento)
              .permit(:descricao)
      end
    end
  end
end
